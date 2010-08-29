class Owner < ActiveRecord::Base
	
	has_many(:books)
	
end
