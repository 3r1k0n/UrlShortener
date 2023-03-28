class UpdateTypeColumnRedirect < ActiveRecord::Migration[7.0]
  def change
    change_table :redirects do |t|
      t.remove :type
      t.integer :status
    end
  end
end
