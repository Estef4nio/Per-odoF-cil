class DisciplinasController < ApplicationController
  before_action :user_signed_in?
  before_action :periodo_present?, only: %i[ new ]
  before_action :set_disciplina, only: %i[ edit update destroy ]

  def new
    @disciplina = Disciplina.new
  end

  def edit
  end
  
  def create
    @disciplina = current_user.periodo.disciplinas.create(params_discplina)
    respond_with(@disciplina, location: root_path)
  end

  def update
    @discplina.update(params_discplina)
    respond_with(@disciplina, location: root_path)
  end

  def destroy
    @disciplina.destroy
    respond_with(@disciplina, location: root_path)
  end

  private

  def params_discplina
    params.require(:disciplina).permit(:nome, :carga_horaria, :creditos, :faltas)
  end

  def set_disciplina
    @disciplinas = Discplina.find_by(id: params[:id])
  end
end