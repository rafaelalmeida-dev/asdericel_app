class Users::SessionsController < Devise::SessionsController
  # você pode limitar:
  layout "auth", only: [ :new ]
  def new
    super
  end

  def create
    super
  end

  def destroy
    super
  end
end
