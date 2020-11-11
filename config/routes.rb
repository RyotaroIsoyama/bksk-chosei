Rails.application.routes.draw do
  get 'time_schedules/show'
  get 'time_schedules/new'
  get 'time_schedules/create'
  get 'events/show'
  get 'events/new'
  resources :events
  resources :time_schedules
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
