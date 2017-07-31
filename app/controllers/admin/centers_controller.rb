class Admin::CentersController < AdminController
  before_action :set_entity, except: [:index]

  # get /admin/centers
  def index
    @collection = Center.page_for_administration(current_page)
  end

  # get /admin/centers/:id
  def show
  end

  protected

  def restrict_access
    require_privilege :program_manager
  end

  def set_entity
    @entity = Center.find_by(id: params[:id])
    if @entity.nil?
      handle_http_404('Cannot find center')
    end
  end
end
