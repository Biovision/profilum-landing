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

  # put /admin/programs/:id/age_groups/:age_group_id
  def add_age_group
    @entity.program_age_groups.create(age_group_id: params[:age_group_id])

    head :no_content
  end

  # delete /admin/programs/:id/age_groups/:age_group_id
  def remove_age_group
    @entity.program_age_groups.where(age_group_id: params[:age_group_id]).destroy_all

    head :no_content
  end

  # put /admin/programs/:id/schools/:school_id
  def add_school
    @entity.program_schools.create(school_id: params[:school_id])

    head :no_content
  end

  # delete /admin/programs/:id/schools/:school_id
  def remove_school
    @entity.program_schools.where(school_id: params[:school_id]).destroy_all

    head :no_content
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
