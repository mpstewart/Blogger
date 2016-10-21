Rails.application.routes.draw do
	# the root url will now call articles.index
	root to:'articles#index'

	resources :articles do
		resources :comments
	end

	resources :tags
	resources :authors

	resources :author_sessions, only: [ :new, :create, :destroy ]

	# it looks like this is how you set up custom routing prefixes
	get 'login' => 'author_sessions#new'
	get 'logout' => 'author_sessions#destroy'

end
