class CreateRecruiters < ActiveRecord::Migration
  def change
    create_table :recruiters do |t|
      t.references :company
      t.string :username
      t.string :email
      t.text :passwordHash
      t.string :passwordSalt

      t.timestamps
    end
    add_index :recruiters, :company_id
  end
end
