# encoding: utf-8
class Admin::ArticlesController < Admin::BaseController
	# layout 'template'
	def new
    @article = Article.new(:published => true, :catalog_id => params[:catalog_id])
	end

  def create
    @article = Article.new(params[:article])
    flash_msg(:success) if @article.save
    respond_back @article
  end

  def edit
  end

  def update 
    @article.update_attributes(params[:article])
    respond_back @article
  end
  
  def index
    tmp_articles = params[:recommend].present? ? Article.recommend : Article.common
    @search = tmp_articles.metasearch(params[:search])
    @articles = @search.includes([:catalog]).order('created_at DESC').page(params[:page]).per(30)
  end

  def destroy
    flash_msg(:success) if @article.destroy
    respond_back @article
  end

end