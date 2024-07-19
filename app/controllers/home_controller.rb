class HomeController < ApplicationController
  before_action :user_signed_in?
  def index
    @disciplinas = current_user.periodo.disciplinas
    @avaliacaos = @disciplinas.flat_map(&:avaliacaos)
    for disc in @disciplinas do
      @media = 0
      @peso = 0
      for ava in disc.avaliacaos do
        @media += ava.nota * ava.peso
        @peso += ava.peso
      end
      @media /= @peso
      disc.set_media(@media)
    end
  end
end