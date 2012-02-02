class Section < ActiveRecord::Base
   belongs_to :resume

   has_many :items
end
