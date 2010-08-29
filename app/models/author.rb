class Author < ActiveRecord::Base
	
	cattr_reader :per_page
	@@per_page = 20

	has_many :books
	belongs_to :country
	
end
