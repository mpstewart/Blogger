class ArticlesController < ApplicationController
	include ArticlesHelper

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end
		
	# create a new record instance to manipulate
	def new
		@article = Article.new
	end
	
	# receive the form information and make the new record
	def create
		@article = Article.new(article_params)
		@article.save

		redirect_to article_path(@article)
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path
	end
end