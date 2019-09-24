class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  def doorkeeper_unauthorized_render_options(error: nil)
    { json: { error: "Not authorized" } }
  end

  def current_user
    User.find_by(email: 'pailwan@gmail.com')
  end
end
