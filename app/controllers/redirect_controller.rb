class RedirectController < AuthController
    include UrlHelper

    before_action :authenticate, only: [:create]

    def create
        params.require(:url)

        redirect_type = params[:redirectType] || 302

        unless [301, 302].include?(redirect_type)
            render json: { error: "Invalid redirect type" }, status: :unprocessable_entity
            return
        end

        created_redirect = @account.redirects.create!(target: params[:url], status: redirect_type)

        render json: { shortUrl: generate_url(relative_path: created_redirect.code) }
    end
    
    def try
        redirection = Redirect.find_by(code: params[:code])

        return render :status => 404 unless redirection.present?

        redirection.record_visit

        return redirect_to "http://"+redirection.target, allow_other_host: true, status: redirection.status
    end
end
