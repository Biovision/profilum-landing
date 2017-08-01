class Admin::AgeGroupsController < AdminController
  include EntityPriority

  before_action :set_entity, except: [:index]

  # get /admin/age_groups
  def index
    @collection = AgeGroup.page_for_administration
  end

  # get /admin/age_groups/:id
  def show
  end

  protected

  def restrict_access
    require_privilege :program_manager
  end

  def set_entity
    @entity = AgeGroup.find_by(id: params[:id])
    if @entity.nil?
      handle_http_404('Cannot find age_group')
    end
  end
end
