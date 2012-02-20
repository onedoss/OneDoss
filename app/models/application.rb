class Application < ActiveRecord::Base
  belongs_to :position
  belongs_to :resume
end
