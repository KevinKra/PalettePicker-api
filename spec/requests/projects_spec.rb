require 'rails_helper'

RSpec.describe 'Projects API', type: :request do
  # initialize test data
  let!(:user) { create(:user) }
  let!(:projects) { create_list(:project, 5, user_id: user.id) }
  let(:user_id) { user.id }
  let(:id) { projects.first.id }

  # Test suite for GET /users/:user_id/projects
  describe 'GET /users/:user_:id/projects' do
    before { get "/users/#{user_id}/projects"}

    context 'when the projects exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all projects' do
        expect(json.size).to eq(5)
      end
    end

    context 'when there are no projects' do
      let!(:user_2) { create(:user) }
      before { get "/users/#{user_2.id}/projects"}

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns an empty array' do
        expect(response.body).to eq("[]")
      end
    end
  end

  # Test suite for POST /users/:user_id/projects/:id
  describe "POST /users/:user_id/projects/" do
    let(:valid_attributes) { { title: "For The Meeting", description: "I really like this." } }

    context 'when request attributes are valid' do
      before { post "/users/#{user_id}/projects", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/users/#{user_id}/projects", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Title can't be blank, Description can't be blank/)
      end
    end
  end

  # Test suite for DELETE /users/:user_id/projects/:id
end