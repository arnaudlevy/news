Rails.application.routes.draw do
  resources :feeds, :entries do
    member do
      post :sync
    end
  end
  root to: 'entries#index'
end
