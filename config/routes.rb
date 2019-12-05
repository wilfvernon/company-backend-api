Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "/accounts/validate/:name", to: "accounts#validate"
      get "/accounts/validate_new/:name", to: "accounts#validate_new"
      get "/accounts/:id/events", to: "events#account_index"
      get "/accounts/:id/upcoming_events", to: "events#account_upcoming_index"
      get "/accounts/:id/characters", to: "characters#account_index"
      get "/accounts/:id/communities", to: "communities#account_index"
      get "/characters/:id/communities", to: "communities#character_index"
      get "/communities/search", to: "communities#search"
      get "/events/:id/threads", to: "event_threads#event_index"
      get "/event_characters/:id/selected_job", to: "event_characters#selected_job"

      patch "/event_characters/slot/:id", to: "event_characters#designate_slot"

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
      resources :community_posts
      resources :community_threads
      resources :event_character_jobs
      resources :jobs
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
