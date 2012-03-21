class ResumesController < ApplicationController
  require 'hpricot'
  require 'zip/zip'
  before_filter :authorize, :only => [:edit, :update, :new, :create]

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
    @user = User.find(params[:user_id])
    @resume = @user.resumes.create()
      
    @file = params[:resume]
    zip = Zip::ZipFile.open(@file.tempfile)
    @xml = zip.read("word/document.xml")
   
    doc = Hpricot::XML(@xml)
    @posts = []
    doc.search("w:t|w:b/").each do |p|
      @posts << p.inner_html
    end
    
    @posts2 = []
    doc.search("*").each do |p|
      if p.name=="w:t"
        @posts2 << p.inner_html
      elsif p.name=="w:p"
        @posts2 << "<br>"
      end
    end
    
    inResInfo=true
    inContactInfo=false
    breakCount=0
    currLines=[]
    @results=[]
    
    doc.search("*").each do |p|
      if p.name=="w:t"
        breakCount=0
        # handle adding name to the information stored with the resume object
        if inResInfo
          nameArray=p.inner_html.split(" ")
          if nameArray.length==1
            @resume.lastName=nameArray[0]
          elsif nameArray.length==2
            @resume.firstName=nameArray[0]
            @resume.lastName=nameArray[1]
          elsif nameArray.length>2
            nameLen=nameArray.length
            @resume.firstName=nameArray[0]
            @resume.lastName=nameArray[nameLen-1]
            @resume.middleName=(nameArray[1,nameLen-2]).join(" ")
          end
          inResInfo=false
          inContactInfo=true
        else
          currLines << p.inner_html
        end
      elsif p.name=="w:p"
        breakCount+=1
        if breakCount==2
          if inContactInfo
            newSection = Section.new
            inContactInfo=false
          else
            @results << @resume.processResumeLines(currLines)
            currLines=[]
          end
        end
      end
    end
    
    @results << @resume.processResumeLines(currLines)
    
    respond_to do |format|
      format.html # show.html.erb
    end
    
  end

  private

  def authorize
    unless user_session.right_user?(params[:user_id].to_i)
      @user = User.find(params[:user_id])
      @resume = Resume.find(params[:id])
      flash[:notice] = "That's not your resume!"
      redirect_to user_resume_path(@user,@resume)
    end
  end

end
