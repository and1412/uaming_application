Rails.application.routes.draw do
  root :to => "contacts#index"
  resources :events
  resources :contacts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
