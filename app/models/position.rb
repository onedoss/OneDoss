class Position < ActiveRecord::Base
  belongs_to :company
  has_many :applications
  has_many :resumes, :through => :applications
end
