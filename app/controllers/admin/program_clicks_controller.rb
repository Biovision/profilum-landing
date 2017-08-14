class Admin::ProgramClicksController < AdminController
  # get /admin/program_clicks
  def index
    @collection = ProgramClick.page_for_administration(current_page)
  end

  private

  def restrict_access
    require_privilege :program_manager
  end
end
