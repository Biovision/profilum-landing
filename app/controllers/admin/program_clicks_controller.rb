class Admin::ProgramClicksController < AdminController
  before_action :set_entity, except: [:index]

  # get /admin/program_clicks
  def index
    @collection = Program.with_clicks.page_for_administration(current_page)
  end

  # get /admin/program_clicks/:id
  def show
    @collection = @entity.program_clicks.page_for_administration(current_page)
  end

  private

  def restrict_access
    require_privilege :click_viewer
  end

  def set_entity
    @entity = Program.find_by(id: params[:id])
    if @entity.nil?
      handle_http_404('Cannot find program')
    end
  end
end
