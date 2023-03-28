class AccountController < AuthController
    before_action :authenticate, only: [:statistic]

    def create
        params.require(:AccountId)

        account_id = params[:AccountId]
        
        # TODO: Service class
        new_account = Account.new(name: account_id)
        password = new_account.update_password

        error_message = nil

        begin
            new_account.save!
        rescue ActiveRecord::RecordNotUnique => e
            error_message = "An Account with the provided id already exists"
        end
        
        success = error_message.nil?

        result = {
            "success" => success,
            "description" => success ? "Your account is opened" : error_message,
            "password" => success ? password : ""
        }

        render json: result
    end

    def statistic
        params.require(:account_id)

        if params[:account_id] != @account.name
            head :unauthorized
            return
        end

        result = @account.redirects.each_with_object({}) do |current_item, obj|
            key = current_item[:target]
            value = current_item[:visits] 

            previous_value = obj[key] || 0
            obj[key] = previous_value + value
        end

        render json: result
    end
end
