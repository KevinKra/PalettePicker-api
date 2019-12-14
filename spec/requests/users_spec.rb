require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  # initialize test data
  let!(:users) { create_list(:user, 3) }
  let(:user_id) { users.first.id }

  # Test suite for GET /users/new


  # Test suite for GET /users/login


  # Test suite for GET /users/:id
  describe 'GET /users/:id' do
    context 'when the user exists' do
      it 'returns the user' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(user_id)
      end

      it 'returns a status code of 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the user does not exist' do
      let(:user_id) { 100 }
      it 'returns a status code of 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find User/)
      end
    end
  end

end