module ArticlesHelper
	# verifies params coming in.
	# since this is how the application receives data to put into the model
	# it would be a bad idea to just take that information at face value.
	# this kind of checking is required by rails, and using a helper method is an easy way to do it
	def article_params
		params.require(:article).permit(:title, :body)
	end
end
