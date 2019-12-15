class ProjectsController < ApplicationController
  before_action :set_projects
  # GET /users/:user_id/projects
  def index 
    json_response(@user.projects)
  end

  # POST /users/:user_id/projects/:id'
  def create
    @user.projects.create!(project_params)
    json_response(@user, :created)
  end

  # DELETE /users/:user_id/projects/:id'

  private
  def project_params
    params.permit(:title, :description)
  end

  def set_projects
    @user = User.find(params[:user_id])
  end
end
