# encoding: utf-8
class Catalog  < ActiveRecord::Base
	validates :name, :presence => true

	default_scope order('position DESC')

	has_many :articles

	has_ancestry  

	scope :by_position, order('position DESC')
	scope :with_tags, where("tags <> ''")

	def self.at(name)
		find_by_name(name)
	end

	def self.on(name)
		at(name).try(:subtree)
	end

	def self.articles(name, sub = true)
		on(name) ? (sub ? on(name).map(&:articles).flatten : at(name).articles) : []
	end

end
