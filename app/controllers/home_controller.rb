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

    @color_data = [
      { date: Date.new(2024, 8, 15), color: "#FF5733" },
      { date: Date.new(2024, 8, 20), color: "#33FF57" },
      { date: Date.new(2024, 8, 25), color: "#3357FF" }
    ]
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