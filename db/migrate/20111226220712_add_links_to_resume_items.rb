class AddLinksToResumeItems < ActiveRecord::Migration
  def change
    add_column :resume_items, :link, :string
  end
end
