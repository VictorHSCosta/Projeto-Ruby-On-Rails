class HomeController < ApplicationController
  before_action :redirect_if_logged_in

  def landing
    @user_count = User.count
  end

  private

  def redirect_if_logged_in
    # Redireciona usuários logados para outra página (ex.: lista de tarefas)
    redirect_to lists_path if user_signed_in?
  end
end
