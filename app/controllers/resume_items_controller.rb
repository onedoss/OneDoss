class ResumeItemsController < ApplicationController

   def create
      @user = User.find(params[:user_id])
      @resume = Resume.find(params[:resume_id])
      @resumeItem = @resume.resume_items.create(params[:resume_item])
      redirect_to user_resume_path(@user, @resume)
   end


  def new
    @user = User.find(params[:user_id])
    @resume = Resume.find(params[:resume_id])
    @resumeItem = ResumeItem.new


    respond_to do |format|

      format.html # new.html.erb

      format.json { render :json => @resumeItem }

    end

  end



  def edit

    @user = User.find(params[:user_id])

    @resume = Resume.find(params[:resume_id])
    @resumeItem = ResumeItem.find(params[:id])
  end

  def destroy
    @user = User.find(params[:user_id])
    @resume = Resume.find(params[:resume_id])
    @resumeItem = ResumeItem.find(params[:id])
    @resumeItem.destroy
    redirect_to user_resume_path(@user,@resume)
  end

end
