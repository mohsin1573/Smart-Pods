class ApplicationController < ActionController::Base
  protected

  def after_sign_up_path_for(resource)
    root_path # Redirect to the homepage
  end
end
