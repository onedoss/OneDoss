class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.references :resume
      t.string :name
      t.integer :order

      t.timestamps
    end
    add_index :sections, :resume_id
  end
end
