class Users::SessionsController < Devise::SessionsController
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
