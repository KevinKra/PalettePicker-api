class PalettesController < ApplicationController
  
  # POST users/:user_id/projects/:project_id/palettes/:id
  def create
    @user = User.find(params[:user_id])
    @project = @user.projects.find_by!(id: params[:project_id])
    @project.palettes.create!(palette_params)
    json_response(@project, :created)
  end

  # DELETE users/:user_id/projects/:project_id/palettes/:id

  private
  def palette_params
    params.permit(:title)
  end
end
