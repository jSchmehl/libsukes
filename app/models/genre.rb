class Genre < ActiveRecord::Base

	cattr_reader :per_page
	@@per_page = 20
	
	has_many :books

end
