class AddVisitsToRedirects < ActiveRecord::Migration[7.0]
  def change
    add_column :redirects, :visits, :integer, default: 0, null: false, :check => 'visits >= 0'
  end
end
