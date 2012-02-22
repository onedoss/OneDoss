class CreateEmployments < ActiveRecord::Migration
  def change
    create_table :employments do |t|
      t.integer :company_id
      t.integer :recruiter_id
      t.datetime :created_at

      t.timestamps
    end
  end
end
