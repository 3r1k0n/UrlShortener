class Redirect < ApplicationRecord
    before_create :populate_code

    belongs_to :account

    def record_visit
        self.visits = self.visits + 1;
        self.save
    end

    private

    def populate_code
        return unless self.code.nil?

        self.code = generate_random_string(length: 8)
    end

    def generate_random_string(length:)
        SecureRandom.alphanumeric(length)
    end
end
