class UsersController < ApplicationController
  before_action :set_user, only: [ :edit, :update, :destroy ]
  add_breadcrumb "Home", :root_path
  add_breadcrumb "Usuário", :users_path

  def index
    byebug
    @q = User.ransack(params[:q])
    @pagy, @users = pagy(@q.result(distinct: true))
  end

  # GET /users/:id/edit
  def edit
  end
  def show
    @user = User.find(params[:id])
  end

  # PATCH/PUT /users/:id
  def update
    if @user.update(user_params)
      redirect_to users_path, notice: "Usuário atualizado com sucesso."
    else
      render :edit
    end
  end

  # DELETE /users/:id
  def destroy
    if @user == current_user
      @user.destroy
      sign_out(@user)
      redirect_to new_user_session_path, notice: "Sua conta foi deletada com sucesso."
    else
      @user.destroy
      redirect_to users_path, notice: "Usuário deletado com sucesso."
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :nome, :role_id)
  end
end
