class Users::SessionsController < Devise::SessionsController
  layout "auth" # usa o layout auth.html.erb

  # você pode limitar:
  # layout "auth", only: [:new]
end
