require 'rails_helper'

RSpec.describe 'Palettes API' do
  # initialize test data
  let!(:user) { create(:user) }
  let!(:project) { create(:project, user_id: user.id) }
  let!(:palettes) { create_list(:palette, 5, project_id: project.id) }
  let(:user_id) { user.id }
  let(:project_id) { project.id }
  let(:id) { palettes.first.id }

  # Test suite for POST users/:user_id/projects/:project_id/palettes/:id
  describe 'POST /users/:user_id/projects/:project_id/palettes' do
    let(:valid_attributes) { { title: "Aqua" } }
    before { post "/users/#{user_id}/projects/#{project_id}/palettes", params: valid_attributes }

    context 'when request attributes are valid' do
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/users/#{user_id}/projects/#{project_id}/palettes", params: {} }

      it 'returns status code 422' do
        expect(response.body).to match(/Validation failed: Title can't be blank/)
      end
    end
  end

  # Test suite for DELETE users/:user_id/projects/:project_id/palettes/:id
end