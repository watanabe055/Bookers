Rails.application.routes.draw do
  get 'homes' => 'homes#top'

  get 'home/about' => 'homes#about'


  devise_for :users

	resources :books

	resources :users, only: [:show , :edit , :update ,:index ,:new]

	resources :post_images, only: [:new, :create, :index, :show]

  	get '/post_images', to: 'posts#show'
 	post '/post_images/create', to: 'posts#create'

	root 'homes#top'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
