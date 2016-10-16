Rails.application.routes.draw do
	# the root url will now call articles.index
	root to:'articles#index'

	resources :articles do
		resources :comments
	end
	resources :tags

end
