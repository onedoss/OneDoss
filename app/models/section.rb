class Section < ActiveRecord::Base
   belongs_to :resume
   validates :order, :presence => true

   has_many :items
end
