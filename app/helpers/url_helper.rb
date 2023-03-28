module UrlHelper
    def generate_url(relative_path:)
        domain = ENV['DOMAIN']
        
        URI.join(domain, relative_path).to_s
    end
end 