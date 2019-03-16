class ProjectsController < ApplicationController
  def show
    @projects = Project.where(nil)
    @projects = @projects.search(params[:search]) if params[:search].present?
    render json: @projects
  end
end
