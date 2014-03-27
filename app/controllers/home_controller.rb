# -*- encoding : utf-8 -*-
class HomeController < ApplicationController
  def index
    @middle_catalog = Catalog.middle
    @middle_articles = @middle_catalog.articles.limit(3)
    @foot_left_catalog = Catalog.foot_left
    @foot_left_articles = @foot_left_catalog.articles.limit(8)
    @foot_middle_catalog = Catalog.foot_middle
    @foot_middle_articles = @foot_middle_catalog.articles.limit(2)
    @foot_right_catalog = Catalog.foot_right
    @foot_right_articles = @foot_right_catalog.articles.limit(2)
    @pics = Catalog.lx(5).first.articles.limit(6)
  end
end
