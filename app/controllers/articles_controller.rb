class ArticlesController < ApplicationController

	#revisa que se all iniciado sesion para acceder excepto para show y index
	before_action :authenticate_user!, except: [:show,:index]
	before_action :set_article, except: [:new,:index,:create]


	#con @ se accede en la vista tambien sin @ se queda solo en el articuloa
	def index
		@articles = Article.all

	end

	def show
		#@article=Article.find(params[:id])

		#@article=Article.where("id = ? OR title = ?",params[:id],params[:title])

		@article.update_visits_count
		@comment = Comment.new
	end

	def destroy
		#@article=Article.find(params[:id])
		@article.destroy
		redirect_to articles_path
		
	end 

	def update
		#@article=Article.find(params[:id])

		if @article.update(article_params) 
			
			redirect_to @article
		else
			render :edit
		end
	end

	def edit
		#@article=Article.find(params[:id])

		
	end

	def new
		@article=Article.new
	end 

	def create
		@article = current_user.articles.new(article_params)
		if @article.save
			redirect_to @article
		else
			render:new
		end

		
	end

	def find
		@article = Article.find_by(params[:article][:title])
		redirect_to @article
	end

	private

	def set_article

		@article=Article.find(params[:id])
	end


	def article_params
		params.require(:article).permit(:title,:body)
	end


end
