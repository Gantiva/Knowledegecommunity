class WelcomeController < ApplicationController
  def index
  	@articles = Article.all
  	@article=Article.new
  	@comment = Comment.new
  end
  def login
  	
  end
  
  def new
    @comment = Comment.new
  end
  
end
