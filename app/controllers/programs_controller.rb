class ProgramsController < AdminController
  before_action :set_entity, only: [:show, :edit, :update, :destroy]
  skip_before_action :restrict_access, only: [:index]

  # get /programs
  def index
    @filter = params[:filter] || Hash.new
    @collection = Program.page_for_visitors(current_page, @filter)
  end

  # get /programs/new
  def new
    @entity = Program.new
  end

  # get /programs/:id
  def show
    @entity.program_clicks.create(tracking_for_entity)
    redirect_to @entity.url
  end

  # post /programs
  def create
    @entity = Program.new(entity_parameters)
    if @entity.save
      redirect_to admin_program_path(@entity.id)
    else
      render :new, status: :bad_request
    end
  end

  # get /programs/:id/edit
  def edit
  end

  # patch /programs/:id
  def update
    if @entity.update(entity_parameters)
      redirect_to admin_program_path(@entity.id), notice: t('programs.update.success')
    else
      render :edit, status: :bad_request
    end
  end

  # delete /programs/:id
  def destroy
    if @entity.destroy
      flash[:notice] = t('programs.destroy.success')
    end
    redirect_to admin_programs_path
  end

  private

  def restrict_access
    require_privilege :program_manager
  end

  def set_entity
    @entity = Program.find_by(id: params[:id])
    if @entity.nil?
      handle_http_404('Cannot find program')
    end
  end

  def entity_parameters
    params.require(:program).permit(Program.entity_parameters)
  end
end
