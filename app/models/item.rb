class Item < ActiveRecord::Base
   validates :positiontitle, :presence => true
   validates :order, :presence => true

  belongs_to :section

end
