class UserSession
  def initialize(session)
    @session = session
    @user_id ||= @session[:user_id]
  end
  
  def setAsRecruiter()
    @session[:rec] = true
  end
  
  def isRecruiter()
    return @session[:rec]
  end
  
  def loginUser(user_id)
    @session[:user_id] = user_id
  end
  
  def loginRecruiter(recruiter_id)
    @session[:recruiter_id] = recruiter_id
  end
  
  def right_user?(user_id)
    @session[:user_id] && @session[:user_id]==user_id
  end
  
  def recruiter_is_company_admin?(company)
    @session[:recruiter_id] && @session[:recruiter_id]==company.recruiter.id
  end
  
  def recruiter_works_for_company?(company)
    @session[:recruiter_id] && company.recruiters.include?(@session[:recruiter_id])
  end
  
end