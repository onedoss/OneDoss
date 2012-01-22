class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.references :user
      t.boolean :default
      t.string :email
      t.text :html
      t.string :firstName
      t.string :lastName
      t.string :middleNames
      t.string :resumeName

      t.timestamps
    end
    add_index :resumes, :user_id
  end
end
