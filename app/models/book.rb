class Book < ActiveRecord::Base
	
	cattr_reader :per_page
	@@per_page = 20
	
	belongs_to :author
	belongs_to :publisher
	belongs_to :collection
	belongs_to :owner
	
	validates_presence_of :title 
	
end
