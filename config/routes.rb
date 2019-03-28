Rails.application.routes.draw do
  resources :feeds, :entries
  root to: 'entries#index'
end
