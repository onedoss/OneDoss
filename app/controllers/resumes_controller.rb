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
   
   
   
  def update

    @user = User.find(params[:user_id])
    @resume = Resume.find(params[:id])

    respond_to do |format|

      if @resume.update_attributes(params[:resume])

        format.html { redirect_to [@user,@resume], :notice => 'Item was successfully updated.' }

        format.json { head :ok }

      else

        format.html { render :action => "edit" }

        format.json { render :json => @resume.errors, :status => :unprocessable_entity }

      end

    end

  end

  def edit

    @user = User.find(params[:user_id])
    @resume = Resume.find(params[:id])
  end

  def destroy
    @user = User.find(params[:user_id])
    @resume = Resume.find(params[:id])
    @resume.destroy
    redirect_to user_path(@user)
  end
  
  def upload
    uploaded_io = params[:resume]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'w') do |file|
      file.write(uploaded_io.read)
    end
  end


end
