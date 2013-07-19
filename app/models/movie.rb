class Movie < ActiveRecord::Base

	#validation
	validates :title, :description, :year_released, :ratings, presence: true
	validates :title, :description, length: {minimum: 10} 
	validates_numericality_of :year_released, :only_integer => true, :greater_than => 0
	validates_numericality_of :ratings, :only_integer => true, :greater_than_or_equal_to => 1, :less_than => 6
	
	
	def self.search_for(query)
		Movie.where("title LIKE :query OR description LIKE :query", query: "%#{query}%")
	end

end
