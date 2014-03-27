# encoding: utf-8
class Catalog  < ActiveRecord::Base
	validates :name, :presence => true

	default_scope order('position DESC')

	has_many :articles

	has_ancestry  

	scope :with_tags, where("tags <> ''")
	scope :top_menus, where(:lx_id => 0)
	scope :middle_menus, where(:lx_id => 1)
	scope :lx, lambda{|lx_id| where(:lx_id => lx_id) }

	def self.middle
		middle_menus.first
	end

	def self.foot_left
		self.where(:lx_id => 2).first
	end

	def self.foot_middle
		self.where(:lx_id => 3).first
	end

	def self.foot_right
		self.where(:lx_id => 4).first
	end

	def self.at(name)
		find_by_name(name)
	end

	def self.on(name)
		at(name).try(:subtree)
	end

	def self.articles(name, sub = true)
		on(name) ? (sub ? on(name).map(&:articles).flatten : at(name).articles) : []
	end

	def article
		articles.where(:cat => true).first
	end

end
