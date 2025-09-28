# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!, only: [ :new, :create ]
  before_action :authorize_internal_user!
  before_action :configure_sign_up_params, only: [ :create ]
  before_action :configure_account_update_params, only: [ :update ]
  skip_before_action :require_no_authentication, only: [ :new, :create ]

  add_breadcrumb "Home", :root_path
  add_breadcrumb "Usuário", :users_path

  # GET /resource/sign_up
  def new
    super
    add_breadcrumb t("common.actions.new"), new_user_registration_path
  end

  # POST /resource
  def create
    build_resource(sign_up_params)

    if resource.save
      redirect_to after_sign_up_path_for(resource), notice: "Usuário criado com sucesso."
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  # GET /resource/edit
  def edit
    super
    add_breadcrumb @user.nome, user_path(@user)
    add_breadcrumb t("common.actions.edit"), edit_user_registration_path(@user)
  end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  def destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def authorize_internal_user!
    unless current_user
      redirect_to root_path, alert: "Acesso negado."
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :cpf, :email, :nome, :role_id ])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [ :email, :nome, :role_id ])
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    users_path
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    super(resource)
  end
end
