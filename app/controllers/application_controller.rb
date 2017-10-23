class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # TODO: May need to use this for Devise
  # protect_from_forgery prepend: true
end
