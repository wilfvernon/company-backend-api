Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "/accounts/validate/:name", to: "accounts#validate"
      get "/accounts/:id/events", to: "events#account_index"
      resources :characters
      resources :event_posts
      resources :event_threads
      resources :contents
      resources :content_events
      resources :events
      resources :event_characters
      resources :community_characters
      resources :communities
      resources :accounts
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
