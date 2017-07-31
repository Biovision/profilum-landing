class Admin::ProgramsController < AdminController
  include ToggleableEntity

  before_action :set_entity, except: [:index]

  # get /admin/programs
  def index
    @collection = Program.page_for_administration(current_page)
  end

  # get /admin/programs/:id
  def show
  end

  protected

  def restrict_access
    require_privilege :program_manager
  end

  def set_entity
    @entity = Program.find_by(id: params[:id])
    if @entity.nil?
      handle_http_404('Cannot find program')
    end
  end
end
