class Author < ActiveRecord::Base
	
	cattr_reader :per_page
	@@per_page = 20

	has_many :books
	belongs_to :country
	
	before_save :name_to_uppercase

  protected
  def name_to_uppercase
    self.name = self.name.upcase
  end
	
end
