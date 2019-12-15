class PalettesController < ApplicationController
  before_action :set_user_project
  before_action :set_project_palette, only: [:destroy]

  # POST /users/:user_id/projects/:project_id/palettes/:id
  def create
    @project.palettes.create!(palette_params)
    json_response(@project, :created)
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
    @palette = @project.palettes.find_by!(id: params[:id])
  end
end
