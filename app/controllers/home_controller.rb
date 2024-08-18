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
      if @peso == 0 then
        @media = 0
      else
        @media /= @peso
      end
      disc.set_media(@media)
    end

    @color_data = @avaliacaos.map do |event|
      {date: event[:data], color: "#FF5733"}
    end
  end
end