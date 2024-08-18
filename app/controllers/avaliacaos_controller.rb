class AvaliacaosController < ApplicationController
  before_action :set_avaliacao, only: [:edit, :update, :destroy]

  # respond_to :html

  def new
    @avaliacao = Avaliacao.new
    @disciplinas = current_user.periodo.disciplinas
    respond_with(@avaliacao)
  end

  def edit
  end

  def create
    @disciplinas = current_user.periodo.disciplinas
    @avaliacao = Avaliacao.new(avaliacao_params)
    @avaliacao.save
    respond_with(@avaliacao, location: root_path)
  end

  def update
    @disciplinas = current_user.periodo.disciplinas
    @avaliacao.update(avaliacao_params)
    respond_with(@avaliacao, location: root_path)
  end

  def destroy
    @avaliacao.destroy!
    respond_with(@avaliacao, location: root_path)
  end

  private
    def set_avaliacao
      @avaliacao = Avaliacao.find(params[:id])
    end

    def avaliacao_params
      params.require(:avaliacao).permit(:nome, :descricao, :nota, :peso, :data, :disciplina_id)
    end
end
