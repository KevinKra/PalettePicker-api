require 'rails_helper'

RSpec.describe 'Colors API', type: :request do
  # initialize test data
  let!(:user) { create(:user) }
  let!(:project) { create(:project, user_id: user.id) }
  let!(:palette) { create(:palette, project_id: project.id) }
  let!(:colors) { create_list(:color, 5, palette_id: palette.id) }
  let(:user_id) { user.id }
  let(:project_id) { project.id }
  let(:palette_id) { palette.id }
  let(:id) { colors.first.id }

  # Test suite for index
  # GET "/users/:user_id/projects/:project_id/palettes/:palette_id/colors"
  describe "GET /users/:user_id/projects/:project_id/palettes/:palette_id/colors" do
    before { get "/users/#{user_id}/projects/#{project_id}/palettes/#{palette_id}/colors"}

    context 'when the colors exist' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the colors' do
        expect(json.size).to be(5)
      end
    end
  end

  # Test suite for create
  # POST "/users/:user_id/projects/:project_id/palettes/:palette_id/colors"
  describe "POST /users/:user_id/projects/:project_id/palettes/:palette_id/colors" do
    let(:valid_attributes) { { hex_code: "#000000" } }
    before { post "/users/#{user_id}/projects/#{project_id}/palettes/#{palette_id}/colors", params: valid_attributes } 

    context 'when request attributes are valid' do
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when request attributes are not valid' do
      before { post "/users/#{user_id}/projects/#{project_id}/palettes/#{palette_id}/colors", params: {} } 

      it 'returns status 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Hex code can't be blank/)
      end
    end
  end

  # Test suite for destroy
  # DELETE "/users/:user_id/projects/:project_id/palettes/:palette_id/colors/:id"
end