class AddUniqueIndexToAccounts < ActiveRecord::Migration[7.0]
  def change
    add_index :accounts, :name, unique: true
  end
end
