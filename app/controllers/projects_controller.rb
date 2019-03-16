class ProjectsController < ApplicationController
  def index
    @projects = Project.where(nil)
    @projects = @projects.description(params[:description]) if params[:description].present?
    @projects = @projects.school_name(params[:school_name]) if params[:school_name].present?
    render json: @projects
  end
end
