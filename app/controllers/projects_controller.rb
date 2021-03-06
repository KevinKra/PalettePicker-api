class ProjectsController < ApplicationController
  before_action :set_projects
  before_action :set_user_project, only: [:destroy]
  # GET /users/:user_id/projects
  def index 
    json_response(@user.projects)
  end

  # POST /users/:user_id/projects/:id'
  def create
    response = @projects.create!(project_params)
    json_response(response, :created)
  end

  # DELETE /users/:user_id/projects/:id'
  def destroy
    @project.destroy
    head :no_content
  end

  private
    def set_user
      @user = User.find(params[:user_id])
    end

    def project_params
      params.permit(:title, :description)
    end

    def set_projects
      set_user
      @projects = @user.projects
    end

    def set_user_project
      @project = @user.projects.find_by!(id: params[:id]) if @user
    end
end
