require_dependency "bongo/application_controller"

module Bongo
  class ArticlesController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def index
      @articles = policy_scope(Article).order(publish_at: :desc)
      respond_to do |format|
        format.html
        format.rss do
          @articles = @articles.published.order(publish_at: :desc)
          render layout: false
        end
      end
    end

    def show
      authorize @article
    end

    def new
      @article = Article.new
      authorize @article
    end

    def edit
      authorize @article
    end

    def create
      @article = Article.new(article_params)
      authorize @article

      if @article.save
        redirect_to @article, notice: 'Article was successfully created.'
      else
        render :new
      end
    end

    def update
      authorize @article

      if @article.update(article_params)
        redirect_to @article, notice: 'Article was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      authorize @article
      @article.destroy
      redirect_to articles_url, notice: 'Article was successfully destroyed.'
    end

    private
      def set_article
        @article = Article.find(params[:id])
      end

      def article_params
        params.require(:article).permit(:title, :text, :publish_at)
      end
  end
end
