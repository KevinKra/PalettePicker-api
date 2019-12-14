class UsersController < ApplicationController
  before_action :set_user, only: [:show, :create, :destroy]

  # GET /users/:id
  def show
    json_response(@user)
  end

  # POST /users
  def create
    @user = User.create!(user_params)
    json_response(@user, :created)
  end

  private
  def user_params
    params.permit(:title, :created_by)
  end
end
