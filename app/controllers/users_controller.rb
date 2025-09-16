class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
       @q = User.ransack(params[:q])   # inicializa o Ransack
       @users = @q.result(distinct: true) # retorna resultado
  end
end
