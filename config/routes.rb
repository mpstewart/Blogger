Rails.application.routes.draw do
	resources :articles do
		resources :comments
	end

	# the root url will now call articles.index
	root to:'articles#index'
end
