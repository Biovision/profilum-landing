class Admin::SchoolsController < AdminController
  include ToggleableEntity

  before_action :set_entity, except: [:index]

  # get /admin/schools
  def index
    @collection = School.page_for_administration(current_page)
  end

  # get /admin/schools/:id
  def show
  end

  protected

  def restrict_access
    require_privilege :program_manager
  end

  def set_entity
    @entity = School.find_by(id: params[:id])
    if @entity.nil?
      handle_http_404('Cannot find school')
    end
  end
end
