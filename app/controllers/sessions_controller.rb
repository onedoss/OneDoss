class SessionsController < ApplicationController

  def new
  end
  
  def new_recruiter
    user_session.setAsRecruiter()
  end

  def create
     flash.now.alert = user_session.isRecruiter()
     if user_session.isRecruiter()
       recruiter = Recruiter.authenticate(params[:username], params[:password]) 
       if recruiter
        session[:recruiter_id]=recruiter.id
        redirect_to recruiter 
       else
        flash.now.alert = "Invalid username or password"
        render "new_recruiter"
       end
     else
        user = User.authenticate(params[:username], params[:password])
        if user
          session[:user_id]=user.id
          redirect_to user
        else
          flash.now.alert = "Invalid username or password"
          render "new"
       end
     end
  end

  def destroy
     session[:user_id]=nil
     session[:recruiter_id]=nil
     redirect_to root_url, :notice => "Logged out"
  end



end
