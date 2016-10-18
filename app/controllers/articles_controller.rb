class ArticlesController < ApplicationController
	include ArticlesHelper

	# show all records
	def index
		@articles = Article.all
	end

	# show a particular record
	def show
		@article = Article.find(params[:id])

		@comment = Comment.new
		@comment.article_id = @article.id
	end
		
	# create a new record instance to manipulate
	# show the new.html.erb template
	def new
		@article = Article.new
	end
	
	# receive the form information and make the new record
	# article_params is defined in articles_helper.rb
	def create
		@article = Article.new(article_params)
		@article.save

		flash.notice = "Article '#{@article.title}' Created!"

		redirect_to article_path(@article)
	end

	def edit
		@article = Article.find(params[:id])
	end

	# same path as show, the difference is the HTTP method used
	def destroy
		# destroy all comments
		@article = Article.find(params[:id])
		@article.comments.each do |comment|
			comment.destroy
		end

		# destroy all tags associated with this article
		@article.tags.each do |tag|
			if tag.articles.count - 1 == 0
				tag.destroy
			end
		end

		@article.destroy

		flash.notice = "Article '#{@article.title}' Deleted!"
		redirect_to articles_path
	end

	def update
		@article = Article.find(params[:id])
		@article.update(article_params)

		flash.notice = "Article '#{@article.title} Updated!"

		redirect_to article_path(@article)
	end
end