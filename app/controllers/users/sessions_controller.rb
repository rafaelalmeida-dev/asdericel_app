class Users::SessionsController < Devise::SessionsController
  layout "auth", only: [ :new ]
  def new
    super
  end
  
   def after_sign_in_path_for(resource)
    dashboard_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def create
    super
  end

  def destroy
    super
  end
end
