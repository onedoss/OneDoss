class ApplicationController < ActionController::Base
  
  helper_method :current_user
  private

  def current_user
     @current_user ||=User.find(session[:user_id]) if session[:user_id]
  end

  protect_from_forgery


  helper_method :user_session
  def user_session
    @user_session ||= UserSession.new(session)
  end

end
