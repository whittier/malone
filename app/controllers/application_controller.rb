class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_person

  private

  helper_method :current_person

  def current_person
    @current_person ||= Person.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
  end

  def require_person
    unless current_person
      store_location
      flash[:info] = "You really need to sign in to get to that page."
      redirect_to new_session_url
      return false
    end
  end

  def store_location
    session[:return_to] = request.url
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

end
