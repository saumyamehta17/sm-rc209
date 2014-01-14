class ArticlesController < ApplicationController
  before_filter :authenticate_user! , except: [:index, :show]
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  respond_to :html
  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
      if @article.save
        flash[:notice] = "Article was successfully created"
      end
    respond_with(@article)
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
      if @article.update(article_params)
        flash[:notice] = "Article was successfully updated"
      end
      respond_with(@article, location: articles_path)
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:name, :content)
    end
end
