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
    @eventos = filter_events(@avaliacaos)

    @color_data = @avaliacaos.map do |event|
      {date: event[:data], color: "#FF5733"}
    end
  end

  def filter_events(events)
    today = Date.today
    six_days_from_now = today + 7
  
    filtered_events = events.select do |event|
      event[:data] >= today && event[:data] <= six_days_from_now
    end
  
    filtered_events.map do |event|
      { nome: event[:nome], dias_restantes: (event[:data] - today).to_i }
    end
  end
end