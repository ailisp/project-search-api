class ProjectsController < ApplicationController
  def filter_range(projects, param_name)
    filter_name = "filter_#{param_name}"
    if params[param_name].present?
      return projects.send(filter_name, params[:actual_start_date], nil, nil)
    end
    param_min = params["#{param_name}_min"]
    param_max = params["#{param_name}_max"]
    if param_min.present? or param_max.present?
      projects.send(filter_name, nil, param_min, param_max)
    else
      projects
    end
  end
  def show
    @projects = Project.where(nil)
    @projects = @projects.search(params[:search]) if params[:search].present?
    @projects = filter_range(@projects, "actual_start_date")
    @projects = filter_range(@projects, "actual_end_date")
    @projects = filter_range(@projects, "planned_end_date")
    @projects = filter_range(@projects, "budget")
    @projects = filter_range(@projects, "final_estimate")
    @projects = filter_range(@projects, "total_spending")
    count = @projects.count
    if params[:per_page].present?
      per_page = params[:per_page].to_i
      page = if params[:page].present? then params[:page].to_i else 1 end
      @projects = @projects.pagination(per_page, page)
      return render json: {data: @projects, total_pages: -(-count/per_page), page: page}
    end
    render json: @projects
  end
end
