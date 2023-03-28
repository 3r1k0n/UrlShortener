class CreateRedirects < ActiveRecord::Migration[7.0]
  def change
    create_table :redirects do |t|
      t.string :target
      t.integer :type, null: true
      t.string :code

      t.timestamps
    end
  end
end
