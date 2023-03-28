require 'bcrypt'

class Account < ApplicationRecord
    has_many :redirects, dependent: :destroy

    def update_password
        password = generate_random_string(length: 8)
        self.password_hash = BCrypt::Password.create(password)

        password
    end

    private

    def generate_random_string(length:)
        SecureRandom.alphanumeric(length)
    end
end
