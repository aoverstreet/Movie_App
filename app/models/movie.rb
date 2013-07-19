class Movie < ActiveRecord::Base

	#validation
	validates :title, :description, :year_released, :ratings presence: true
	validates :title, :description, length: {minimum: 10} 
	
	
	
	def self.search_for(query)
		Movie.where("title LIKE :query OR description LIKE :query", query: "%#{query}%")
	end

end
