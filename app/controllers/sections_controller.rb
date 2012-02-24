class SectionsController < ApplicationController
  before_filter :authorize, :only => [:edit, :update, :new, :create]

   def create
      @user = User.find(params[:user_id])
      @resume = Resume.find(params[:resume_id])
      @section = @resume.sections.create(params[:section])
      redirect_to user_resume_path(@user, @resume)
   end


  def new
    @user = User.find(params[:user_id])
    @resume = Resume.find(params[:resume_id])
    @section = Section.new


    respond_to do |format|

      format.html # new.html.erb

      format.json { render :json => @section }

    end

  end



  def edit

    @user = User.find(params[:user_id])
    @resume = Resume.find(params[:resume_id])
    @section = Section.find(params[:id])
  end

  def destroy
    @user = User.find(params[:user_id])
    @resume = Resume.find(params[:resume_id])
    @section = Section.find(params[:id])
    @section.destroy
    redirect_to user_resume_path(@user,@resume)
  end
  
  private
  
  
  def authorize
    unless user_session.right_user?(params[:user_id].to_i)
      @user = User.find(params[:user_id])
      @resume = Resume.find(params[:resume_id])
      flash[:notice] = "That's not your resume!"
      redirect_to user_resume_path(@user,@resume)
    end
  end

end
