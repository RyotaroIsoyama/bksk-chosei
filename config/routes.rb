Rails.application.routes.draw do
  get "time_schedules/list",to: "time_schedules#list"
  resources :events
  resources :time_schedules
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
