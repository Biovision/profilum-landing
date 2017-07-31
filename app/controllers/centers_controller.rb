class CentersController < AdminController
  before_action :set_entity, only: [:edit, :update, :destroy]

  # get /centers/new
  def new
    @entity = Center.new
  end

  # post /centers
  def create
    @entity = Center.new(entity_parameters)
    if @entity.save
      redirect_to admin_center_path(@entity.id)
    else
      render :new, status: :bad_request
    end
  end

  # get /centers/:id/edit
  def edit
  end

  # patch /centers/:id
  def update
    if @entity.update(entity_parameters)
      redirect_to admin_center_path(@entity.id), notice: t('centers.update.success')
    else
      render :edit, status: :bad_request
    end
  end

  # delete /centers/:id
  def destroy
    if @entity.destroy
      flash[:notice] = t('centers.destroy.success')
    end
    redirect_to admin_centers_path
  end

  private

  def restrict_access
    require_privilege :program_manager
  end

  def set_entity
    @entity = Center.find_by(id: params[:id])
    if @entity.nil?
      handle_http_404('Cannot find center')
    end
  end

  def entity_parameters
    params.require(:center).permit(Center.entity_parameters)
  end
end
