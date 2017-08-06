Rails.application.routes.draw do
# Because this is a route file we can assume these
# strings are URL fragments

  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
