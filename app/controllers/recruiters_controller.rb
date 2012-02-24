class RecruitersController < ApplicationController
  # GET /recruiters
  # GET /recruiters.json
  def index
    @recruiters = Recruiter.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recruiters }
    end
  end

  # GET /recruiters/1
  # GET /recruiters/1.json
  def show
    @recruiter = Recruiter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recruiter }
    end
  end

  # GET /recruiters/new
  # GET /recruiters/new.json
  def new
    @recruiter = Recruiter.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recruiter }
    end
  end

  # GET /recruiters/1/edit
  def edit
    @recruiter = Recruiter.find(params[:id])
  end

  # POST /recruiters
  # POST /recruiters.json
  def create
    @recruiter = Recruiter.new(params[:recruiter])

    respond_to do |format|
      if @recruiter.save
        format.html { redirect_to @recruiter, notice: 'Recruiter was successfully created.' }
        format.json { render json: @recruiter, status: :created, location: @recruiter }
      else
        format.html { render action: "new" }
        format.json { render json: @recruiter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /recruiters/1
  # PUT /recruiters/1.json
  def update
    @recruiter = Recruiter.find(params[:id])

    respond_to do |format|
      if @recruiter.update_attributes(params[:recruiter])
        format.html { redirect_to @recruiter, notice: 'Recruiter was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @recruiter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recruiters/1
  # DELETE /recruiters/1.json
  def destroy
    @recruiter = Recruiter.find(params[:id])
    @recruiter.destroy

    respond_to do |format|
      format.html { redirect_to recruiters_url }
      format.json { head :ok }
    end
  end
  
  def approve
    @employment=Employment.find(params[:employment_id])
    if @employment.bothApprove()
      flash[:notice] = "Request accepted."
    end
    redirect_to recruiter_path(@recruiter)
    
  end
  
  private
  
  def authorize
    unless user_session.right_recruiter?(params[:id].to_i)
      @recruiter = Recruiter.find(params[:recruiter_id])
      flash[:notice] = "That's not your section!"
      redirect_to @recruiter
    end
  end
  
end
