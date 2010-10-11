class Book < ActiveRecord::Base
	
	cattr_reader :per_page
	@@per_page = 20
	scoped_search :on => :title
	scoped_search :in => :author, :on => [:name, :firstname]
	scoped_search :in => :collection, :on => :name
	scoped_search :in => :publisher, :on => :name
	scoped_search :in => :owner, :on => :name
	scoped_search :in => :genre, :on => :name
	
	belongs_to :author
	belongs_to :publisher
	belongs_to :collection
	belongs_to :owner
	belongs_to :genre
	
	validates_presence_of :title 
	
end
