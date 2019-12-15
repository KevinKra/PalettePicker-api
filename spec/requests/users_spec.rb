require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  # initialize test data
  let!(:users) { create_list(:user, 3) }
  let(:user_id) { users.first.id }

  # Test suite for GET /users


  # Test suite for GET /users/login


  # Test suite for GET /users/:id
  describe 'GET /users/:id' do
    before { get "/users/#{user_id}" }

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

  # Test suite for POST /users
  describe 'POST /users' do
    let(:valid_attributes) { { username: 'Tychus', password: 'password1' } }
    
    context 'when the request is valid' do
      before { post '/users', params: valid_attributes }
     
      it 'creates a user' do
        expect(json['username']).to eq('Tychus')
        expect(json['password']).to eq('password1')
      end

      it 'returns a status code of 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is not valid' do
      before { post '/users', params: { username: "Timmy" } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Password can't be blank/)
      end
    end
  end


  # Test suite for DELETE /users/:id
  describe 'DELETE /users/:id' do
    before { delete "/users/#{user_id}" }

    it 'returns with status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end