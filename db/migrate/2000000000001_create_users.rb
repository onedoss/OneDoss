class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.text :passwordHash
      t.string :passwordSalt

      t.timestamps
    end
  end
end
