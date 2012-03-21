class Resume < ActiveRecord::Base
   validates :resumeName, :presence => true

   belongs_to :user

   has_many :sections
   
   
  has_many :applications
  has_many :resumes, :through => :applications
  
    def processResumeLines(lines)
      return lines.join("***")
    end

end
