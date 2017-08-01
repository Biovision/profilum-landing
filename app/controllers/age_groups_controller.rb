class AgeGroupsController < AdminController
  before_action :set_entity, only: [:edit, :update, :destroy]

  # get /age_groups/new
  def new
    @entity = AgeGroup.new
  end

  # post /age_groups
  def create
    @entity = AgeGroup.new(entity_parameters)
    if @entity.save
      redirect_to admin_age_group_path(@entity.id)
    else
      render :new, status: :bad_request
    end
  end

  # get /age_groups/:id/edit
  def edit
  end

  # patch /age_groups/:id
  def update
    if @entity.update(entity_parameters)
      redirect_to admin_age_group_path(@entity.id), notice: t('age_groups.update.success')
    else
      render :edit, status: :bad_request
    end
  end

  # delete /age_groups/:id
  def destroy
    if @entity.destroy
      flash[:notice] = t('age_groups.destroy.success')
    end
    redirect_to admin_age_groups_path
  end

  private

  def restrict_access
    require_privilege :program_manager
  end

  def set_entity
    @entity = AgeGroup.find_by(id: params[:id])
    if @entity.nil?
      handle_http_404('Cannot find age_group')
    end
  end

  def entity_parameters
    params.require(:age_group).permit(AgeGroup.entity_parameters)
  end
end
