Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
  get 'homes/about' => 'homes#about'
  
  resources :trainings do
    resource :training_favorites, only:[:create,:destroy]
    resources :training_comments, only:[:create,:destroy]
  end
  
  resources :foods do
    resource :food_favorites, only:[:create,:destroy]
    resources :food_comments, only:[:create,:destroy]
  end
  
  resources :users, only:[:index,:show,:edit,:update]
end
