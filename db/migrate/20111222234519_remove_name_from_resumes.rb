class RemoveNameFromResumes < ActiveRecord::Migration
  def up
    remove_column :resumes, :name
  end

  def down
    add_column :resumes, :name, :string
  end
end
