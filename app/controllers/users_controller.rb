class UsersController < ApplicationController
  add_breadcrumb "Home", :root_path
  add_breadcrumb "Usuário", :users_path

  def index
    @q = User.ransack(params[:q])   # inicializa o Ransack
    @pagy, @users = pagy(@q.result(distinct: true)) # retorna resultado
  end
end
