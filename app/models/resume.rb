class Resume < ActiveRecord::Base
   validates :resumeName, :presence => true

   belongs_to :user

   has_many :sections
end
