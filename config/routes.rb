Rails.application.routes.draw do
  # get 'sposts/show'
  #
  # get 'sposts/new'
  #
  # get 'sposts/edit'
resources :users, only: [:new, :create]
post "users/confirm" => "users#confirm"
  resources :topics do
    resources :posts, except: [:index]
    resources :sposts, except: [:index]
    resources :sessions, only: [:new, :create, :destroy]
end
  get 'about' => 'welcome#about'
  root 'welcome#index'
end
