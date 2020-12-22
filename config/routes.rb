Rails.application.routes.draw do
  root to: 'events#new'
  get "time_schedules/show",to: "time_schedules#show"
  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}
  get "time_schedules/list",to: "time_schedules#list"
  get "events/token",to: "events#token"
  post "events/callback",to: "events#callback"
  get "calendar/index", to:"calendar#index"
  get "oauth2callback", to:"calendar#callback"

  resources :events
  resources :time_schedules
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
