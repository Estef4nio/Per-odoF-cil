module ApplicationHelper
  def inline_svg(path, options = {})
    file_path = Rails.root.join('app/assets/images', path)
    if File.exist?(file_path)
      file = File.read(file_path)
      doc = Nokogiri::HTML::DocumentFragment.parse(file)
      svg = doc.at_css('svg')
      options.each { |key, value| svg[key.to_s] = value }
      doc.to_html.html_safe
    else
      "(SVG not found)"
    end
  end

  def get_eventos
    @disciplinas = current_user.periodo.disciplinas
    @avaliacaos = @disciplinas.flat_map(&:avaliacaos)
    @eventos = filter_events(@avaliacaos)
  end

  private 

  def filter_events(events)
    today = Date.today
    six_days_from_now = today + 7
  
    filtered_events = events.select do |event|
      event[:data] >= today && event[:data] <= six_days_from_now
    end
  
    filtered_events.map do |event|
      { nome: event[:nome], dias_restantes: (event[:data] - today).to_i, data: event[:data].strftime('%d/%m/%Y') }
    end
  end
end
