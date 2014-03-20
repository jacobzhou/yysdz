# encoding: utf-8
class Article  < ActiveRecord::Base
  belongs_to :catalog, :counter_cache => true

  default_scope order('position DESC')

  scope :published, where(:published => true)
  scope :has_cover, where("cover_file_name IS NOT NULL")
  scope :no_cover, where(:cover_file_name => nil) 
  scope :can_show, published.order('published_at DESC')
  scope :by_position, published.order('position DESC, published_at DESC')
  scope :recommend, where(:recommend => true)
  scope :common, where('recommend = 0 or recommend is null ')
  scope :tops, where(:top => true).by_position

  validates :title, :presence => true
  validates :content, :presence => true
  validates :catalog_id, :presence => true
  validates :position, :presence => true

end
