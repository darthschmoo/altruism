# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  layout "application"

  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password, :password_confirmation

  helper_method :current_user

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = (current_user_session && current_user_session.record) || AnonymousUser.new
  end

  def must_be_logged_in
    @user = current_user
    if @user.anonymous?
      flash[:error] = "Create an account first?"
      redirect_to( login_url )
      return false
    end
  end

  def access_denied
    flash[:error] = "You do not have permission to do that"
    redirect_to "/"
    return false
  end
end
