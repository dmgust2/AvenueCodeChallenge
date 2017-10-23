Rails.application.routes.draw do
  # Tasks and subtasks
  resources :tasks do
    resources :subtasks
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Root home
  root to: 'tasks#index'
end
