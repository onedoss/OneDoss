class ResumesController < ApplicationController

   def create
      @user = User.find(params[:user_id])
      @resume = @user.resumes.create(params[:resume])
      redirect_to user_resume_path(@user, @resume)
   end


   def show

    @user = User.find(params[:user_id])
    @resume = Resume.find(params[:id])


    respond_to do |format|

      format.html # show.html.erb

      format.json { render :json => @resume }

    end

   end

  def edit

    @user = User.find(params[:id])

    @resume = Resume.find(params[:id])
  end

  def destroy
    @user = User.find(params[:user_id])
    @resume = Resume.find(params[:resume_id])
    @resume.destroy
    redirect_to user_resume_path(@user)
  end


end
