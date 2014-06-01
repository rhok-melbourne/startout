class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :allow_responsive_is_iframe

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << :name
  end


  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "Access denied."
    redirect_to (request.referrer || root_path)
  end

  def allow_responsive_is_iframe
    response.headers['X-Frame-Options'] = 'ALLOW-FROM http://responsive.is/'
  end

  def after_sign_in_path_for(resource)
    case current_user.role
    when 'mentee'
      "/relationships/#{current_user.mentee_relationship.id}"
    when 'mentor'
      '/relationships'
    end
  end
end
