class CreateResumeItems < ActiveRecord::Migration
  def change
    create_table :resume_items do |t|
      t.references :resume
      t.string :type
      t.string :section
      t.string :positiontitle
      t.string :location
      t.string :startMonth
      t.string :startSeason
      t.integer :startYear
      t.string :endMonth
      t.string :endSeason
      t.integer :endYear
      t.text :description

      t.timestamps
    end
    add_index :resume_items, :resume_id
  end
end
