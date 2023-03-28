class AddAccountToRedirects < ActiveRecord::Migration[7.0]
  def change
    add_reference :redirects, :account, foreign_key: true
  end
end

logged_account = authenticate_with_http_basic do |account_id, password| 
  acc = Account.find_by(name: account_id)

  return nil unless acc.present? && BCrypt::Password.new(acc.password_hash)==password

  acc
end