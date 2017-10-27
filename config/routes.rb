Rails.application.routes.draw do
  # get 'sposts/show'
  #
  # get 'sposts/new'
  #
  # get 'sposts/edit'
resources :users, only: [:new, :create]
  resources :topics do
    resources :posts, except: [:index]
    resources :sposts, except: [:index]

end
  get 'about' => 'welcome#about'
  root 'welcome#index'
end
