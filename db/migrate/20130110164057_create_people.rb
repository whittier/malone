class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :password_digest
      t.string :auth_token
      t.string :email

      t.timestamps
    end
  end
end
