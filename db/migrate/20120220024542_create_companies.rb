class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :industry
      t.text :description
      t.integer :employees
      t.references :recruiter

      t.timestamps
    end
    add_index :companies, :recruiter_id
  end
end
