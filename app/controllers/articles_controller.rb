class ArticlesController < ApplicationController
    before_action :logged_in_user, only: [:new, :create, :destroy, :edit, :update]
    
    def new
        @article = Article.new
    end
    
    def edit
        @article = Article.find(params[:id])
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
    
    def update
        @article = Article.find(params[:id])
        
        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end
    end
    
    def destroy
        @article = Article.find(params[:id])
        
        @article.destroy
        flash[:success] = "Article deleted"
        redirect_to articles_path
    end
    
    private
        def article_params
            params.require(:article).permit(:title, :text)
        end
end
