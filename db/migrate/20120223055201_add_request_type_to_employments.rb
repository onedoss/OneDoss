class AddRequestTypeToEmployments < ActiveRecord::Migration
  def change
    add_column :employments, :requestType, :integer
  end
end
