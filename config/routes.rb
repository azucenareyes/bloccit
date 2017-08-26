Rails.application.routes.draw do
  # get 'posts/show'
  # This will run the show method of class PostsController,
  # found in file posts_controller.rb.


  # Because this is a route file we can assume these
  # strings are URL fragments

  resources :posts
# "welcome_about to about" it looks like they were essentially
# just reversed.

  get 'about' => 'welcome#about'
# "welcome_index to root"
  root 'welcome#index'

  # For details on the DSL available within this file, see
  # http://guides.rubyonrails.org/routing.html
end


# # This
# get 'about' => 'welcome#about'
# # is just this:
# get( {'about' => 'welcome#about'} )
#
# # So this
# get 'about' => 'welcome#about', 'another-key' => 'another-value'
# # is just this:
# get( {'about' => 'welcome#about', 'another-key' => 'another-value'} )
#
# # Because get is a method that is called with one hash argument,
# # defined something like this:
#
# def get(h) do       # Here, h is that single hash argument.
#   ...
# end
