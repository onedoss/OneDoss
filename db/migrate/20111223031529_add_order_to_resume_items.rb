class AddOrderToResumeItems < ActiveRecord::Migration
  def change
    add_column :resume_items, :order, :integer
  end
end
