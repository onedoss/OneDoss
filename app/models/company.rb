class Company < ActiveRecord::Base
  belongs_to :recruiter
  has_many :employments
  has_many :recruiters, :through => :employments 
    def newRecruiter(recruiter_id, requestType)
        empl = Employment.new(:recruiter_id => recruiter_id, :company_id => self.id, :requestType => requestType)
        empl.save
    end
    
  def recruiter_is_company_admin?(recruiter_id)
    self.recruiter.id && self.recruiter.id==recruiter_id
  end
  
  def recruiter_works_for_company?(recruiter_id)
    self.recruiters.include?(recruiter_id)
  end
end
