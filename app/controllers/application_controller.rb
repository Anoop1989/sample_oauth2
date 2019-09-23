class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  def current_user
    User.find_by(email: 'pailwan@gmail.com')
  end
end
