Rails.application.routes.draw do
  post '/account', to: 'account#create'
  post '/register', to: 'redirect#create'

  get '/statistic/:account_id', to: 'account#statistic'

  get ':code', to: 'redirect#try'
end
