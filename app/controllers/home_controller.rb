class HomeController < ApplicationController
  before_action :user_signed_in?
  def index
    @disciplinas = current_user.periodo.disciplinas
  end
end