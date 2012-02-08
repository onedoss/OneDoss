class AddPresentToItems < ActiveRecord::Migration
  def change
    add_column :items, :present, :boolean, :default=>false
  end
end
