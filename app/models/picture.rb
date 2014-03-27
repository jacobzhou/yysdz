# encoding: utf-8
class Picture < ActiveRecord::Base
  PLACES = ['LOGO', '首页幻灯片', '首页二维码','胎教课堂幻灯片', 'VIP大图','VIP服务','广告']

  default_scope order('position DESC')

  has_attached_file :file, :styles => { :thumb => "65x35#" }

  validates_attachment :file, :presence => true,
  :content_type => { :content_type => Setting.image_types }

  validates :alt, :presence => true
  validates :place, :presence => true

  scope :on, lambda{|place| where(:place => place) }

end
