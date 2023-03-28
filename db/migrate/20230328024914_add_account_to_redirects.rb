class AddAccountToRedirects < ActiveRecord::Migration[7.0]
  def change
    add_reference :redirects, :account, foreign_key: true
  end
end
