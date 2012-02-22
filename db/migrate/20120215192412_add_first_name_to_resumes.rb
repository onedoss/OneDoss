class AddFirstNameToResumes < ActiveRecord::Migration
  def change
    add_column :resumes, :city, :string
    add_column :resumes, :state, :string
    add_column :resumes, :country, :string
    add_column :resumes, :street, :string
    add_column :resumes, :phone, :string
    add_column :resumes, :website, :string
  end
end
