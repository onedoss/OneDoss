class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :title
      t.references :company
      t.string :category
      t.text :description
      t.integer :numPositions

      t.timestamps
    end
    add_index :positions, :company_id
  end
end
