class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.integer :position_id
      t.integer :resume_id
      t.integer :applicationType
      t.datetime :created_at

      t.timestamps
    end
  end
end
