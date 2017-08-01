class SchoolsController < AdminController
  before_action :set_entity, only: [:edit, :update, :destroy]

  # get /schools/new
  def new
    @entity = School.new
  end

  # post /schools
  def create
    @entity = School.new(entity_parameters)
    if @entity.save
      redirect_to admin_school_path(@entity.id)
    else
      render :new, status: :bad_request
    end
  end

  # get /schools/:id/edit
  def edit
  end

  # patch /schools/:id
  def update
    if @entity.update(entity_parameters)
      redirect_to admin_school_path(@entity.id), notice: t('schools.update.success')
    else
      render :edit, status: :bad_request
    end
  end

  # delete /schools/:id
  def destroy
    if @entity.destroy
      flash[:notice] = t('schools.destroy.success')
    end
    redirect_to admin_schools_path
  end

  private

  def restrict_access
    require_privilege :program_manager
  end

  def set_entity
    @entity = School.find_by(id: params[:id])
    if @entity.nil?
      handle_http_404('Cannot find school')
    end
  end

  def entity_parameters
    params.require(:school).permit(School.entity_parameters)
  end
end
