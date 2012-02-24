class Employment < ActiveRecord::Base
  belongs_to :company
  belongs_to :recruiter
   
    def bothApprove()
      self.requestType=1
      return self.save
    end
end

# rails generate model employment company_id:integer recruiter_id:integer created_at:datetime
