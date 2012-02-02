class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :section
      t.string :positiontitle
      t.string :organization
      t.string :location
      t.string :startMonth
      t.string :startSeason
      t.integer :startYear
      t.string :endMonth
      t.string :endSeason
      t.integer :endYear
      t.text :description
      t.integer :order
      t.text :link

      t.timestamps
    end
    add_index :items, :section_id
  end
end
