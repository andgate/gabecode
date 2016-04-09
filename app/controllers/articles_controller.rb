class ArticlesController < ApplicationController
    before_action :logged_in_user, only: [:new, :create, :destroy]
    
    def new
    end
    
    def index
        @articles = Article.all
    end
    
    def show
        @article = Article.find(params[:id])
    end
    
    def create
        @article = Article.new(article_params)
        
        @article.save
        redirect_to @article
    end
    
    def destroy
        @article = Article.find(params[:id])
        
        @article.destroy
        flash[:success] = "Article deleted"
        redirect_to request.referrer || root_url
    end
    
    private
        def article_params
            params.require(:article).permit(:title, :text)
        end
end
