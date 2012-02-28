class Company < ActiveRecord::Base
   validates_presence_of :name
   validates_uniqueness_of :name
  belongs_to :recruiter
  has_many :employments
  has_many :recruiters, :through => :employments 
    def newRecruiter(recruiter_id, requestType)
        empl = Employment.new(:recruiter_id => recruiter_id, :company_id => self.id, :requestType => requestType)
        empl.save
    end
    
end
