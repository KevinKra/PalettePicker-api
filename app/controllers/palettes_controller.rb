class PalettesController < ApplicationController
  before_action :set_user_project
  before_action :set_project_palette, only: [:destroy]

  # GET /users/:user_id/projects/:project_id/palettes
  def index
    json_response(@project.palettes.all)
  end

  # POST /users/:user_id/projects/:project_id/palettes/:id
  def create
    response = @project.palettes.create!(palette_params)
    json_response(response, :created)
  end

  # DELETE /users/:user_id/projects/:project_id/palettes/:id
  def destroy
    @palette.destroy
  end


  private
  def palette_params
    params.permit(:title)
  end

  def set_user_project
    @user = User.find(params[:user_id])
    @project = @user.projects.find_by!(id: params[:project_id])
  end

  def set_project_palette
    @palette = @project.palettes.find_by!(id: params[:id]) if @project
  end
end
