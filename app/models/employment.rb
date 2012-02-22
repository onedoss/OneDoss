class Employment < ActiveRecord::Base
  belongs_to :company
  belongs_to :recruiter
end

# rails generate model employment company_id:integer recruiter_id:integer created_at:datetime
