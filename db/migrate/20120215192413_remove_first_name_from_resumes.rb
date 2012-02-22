class RemoveFirstNameFromResumes < ActiveRecord::Migration
  def change
    remove_column :resumes, :first_name
    remove_column :resumes, :middle_names
    remove_column :resumes, :last_name
  end
end
