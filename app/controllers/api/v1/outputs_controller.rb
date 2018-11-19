class Api::V1::OutputsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_output, only: [ :show ]

  def index
    @outputs = policy_scope(Output)
  end

  def show

  end

  def create
    @output = Output.new(output_params)
    authorize @output
    @output.user = current_user
    if @output.save
      render :show, status: :created
    else
      render_error
    end
  end

  def update
    if @output.update(output_params)
      render :show
    else
      render_error
    end
  end

  private

  def set_output
    @output = Output.find(params[:id])
    authorize @output  # For Pundit
  end

  def output_params
    params.require(:output).permit(:date, :quantity, :project)
  end

  def render_error
    render json: { errors: @output.errors.full_messages },
      status: :unprocessable_entity
  end
end
