class ColorsController < ApplicationController
  before_action :set_palette
  before_action :set_palette_color, only: [:destroy]

  # GET /users/:user_id/projects/:project_id/palettes/:palette_id/colors"
  def index
    json_response(@palette.colors)
  end

  # POST "/users/:user_id/projects/:project_id/palettes/:palette_id/colors"
  def create
    response = @palette.colors.create!(color_params)
    json_response(response, :created)
  end

  # DELETE "/users/:user_id/projects/:project_id/palettes/:palette_id/colors/:id"
  def destroy
    @color.destroy
    head :no_content
  end

  private
    def color_params
      params.permit(:hex_code)
    end

    def set_user 
      @user = User.find(params[:user_id])
    end

    def set_palette
      set_user
      @project = @user.projects.find_by!(id: params[:project_id])
      @palette = @project.palettes.find_by!(id: params[:palette_id])
    end

    def set_palette_color
      @color = @palette.colors.find(params[:id]) if @palette
    end
end
