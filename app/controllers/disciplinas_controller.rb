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
    topics_params = params[:disciplina][:topics] || []
    @disciplina = current_user.periodo.disciplinas.create(params_disciplina.merge(topics: topics_params))
    respond_with(@disciplina, location: root_path)
  end

  def update
    topics_params = params[:disciplina][:topics] || []
    @disciplina.update(params_disciplina.merge(topics: topics_params))
    respond_with(@disciplina, location: root_path)
  end

  def destroy
    @disciplina.destroy
    respond_with(@disciplina, location: root_path)
  end

  private

  def params_disciplina
    params.require(:disciplina).permit(:nome, :carga_horaria, :creditos, :faltas, topics: [])
  end

  def set_disciplina
    @disciplina = Disciplina.find_by(id: params[:id])
  end
end