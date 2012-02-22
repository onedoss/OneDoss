class Company < ActiveRecord::Base
  belongs_to :recruiter
  has_many :employments
  has_many :recruiters, :through => :employments
end
