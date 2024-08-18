class DisciplinasController < ApplicationController
  before_action :user_signed_in?
  before_action :periodo_present?, only: %i[ new ]
  before_action :set_disciplina, only: %i[ edit update destroy ]

  def new
    @disciplina = Disciplina.new
    @disciplina.topicos.build
    respond_with(@disciplina)
  end

  def edit
  end
  
  def create
    @disciplina = current_user.periodo.disciplinas.new(params_disciplina)
    @disciplina.save
    respond_with(@disciplina, location: root_path)
  end

  def update
    @disciplina.update(params_disciplina)
    respond_with(@disciplina, location: root_path)
  end

  def destroy
    @disciplina.destroy
    respond_with(@disciplina, location: root_path)
  end

  private

  def params_disciplina
    params.require(:disciplina).permit(:nome, :carga_horaria, :creditos, :faltas, topicos_attributes: [:id, :nome, :_destroy])
  end

  def set_disciplina
    @disciplina = Disciplina.find_by(id: params[:id])
  end
end