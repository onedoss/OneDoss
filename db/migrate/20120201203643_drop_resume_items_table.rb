class DropResumeItemsTable < ActiveRecord::Migration
  def up
    drop_table :resume_items
  end

  def down
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
      t.integer :order
      t.string :link

      t.timestamps
    end
    add_index :resume_items, :resume_id
  end
end
