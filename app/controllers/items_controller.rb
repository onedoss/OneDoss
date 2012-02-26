class ItemsController < ApplicationController
  before_filter :authorize, :only => [:edit, :update, :new, :create]

   def create
      @user = User.find(params[:user_id])
      @resume = Resume.find(params[:resume_id])
      @section = Section.find(params[:section_id])
      @item = @section.items.create(params[:item])
      redirect_to user_resume_path(@user, @resume)
   end


  def new
    @user = User.find(params[:user_id])
    @resume = Resume.find(params[:resume_id])
    @section = Section.find(params[:section_id])
    @item = Item.new


    respond_to do |format|

      format.html # new.html.erb

      format.json { render :json => @item }

    end

  end


  def update

    @user = User.find(params[:user_id])
    @resume = Resume.find(params[:resume_id])
    @section = Section.find(params[:section_id])
    @item = Item.find(params[:id])

    respond_to do |format|

      if @item.update_attributes(params[:item])

        format.html { redirect_to [@user,@resume], :notice => 'Item was successfully updated.' }

        format.json { head :ok }

      else

        format.html { render :action => "edit" }

        format.json { render :json => @item.errors, :status => :unprocessable_entity }

      end

    end

  end

  def edit
    @user = User.find(params[:user_id])
    @resume = Resume.find(params[:resume_id])
    @section = Section.find(params[:section_id])
    @item = Item.find(params[:id])
  end

  def destroy
    @user = User.find(params[:user_id])
    @resume = Resume.find(params[:resume_id])
    @section = Section.find(params[:section_id])
    @item = Item.find(params[:id])
    @item.destroy
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
