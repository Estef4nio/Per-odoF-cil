class PeriodosController < ApplicationController
  before_action :user_signed_in?
  before_action :set_periodo, only: %i[edit update destroy]

  def new
    @periodo = Periodo.new
  end

  def edit; end

  def create
    @periodo = current_user.create_periodo(params_periodo)
    to = session[:to]
    session[:to] = nil
    if to == "disciplina"
      respond_with(@periodo, location: new_disciplina_path)
    else
      respond_with(@periodo, location: root_path)
    end
  end

  def update
    @periodo.update(params_periodo)
    @periodo.save
    respond_with(@periodo, location: root_path)
  end

  def destroy
    @periodo.destroy
    respond_with(@periodo, location: root_path)
  end

  private

  def params_periodo
    params.require(:periodo).permit(:nome)
  end

  def set_periodo
    @periodo = Periodo.find_by(id: params[:id])
  end
end
