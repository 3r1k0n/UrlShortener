class AddAccount < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :name, unique: true, null: false
      t.string :password_hash, null: false
      
      t.timestamps
    end
  end
end
