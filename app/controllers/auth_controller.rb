require 'bcrypt'

class AuthController < ActionController::API
    include ActionController::HttpAuthentication::Basic::ControllerMethods

    private

    def authenticate
        logged_account = authenticate_with_http_basic do |account_id, password| 
            acc = Account.find_by(name: account_id)

            if acc.present? && BCrypt::Password.new(acc.password_hash)==password
                acc
            else
                nil
            end
        end

        if logged_account.present?
            @account = logged_account
        else
            head :unauthorized
        end
    end
end
