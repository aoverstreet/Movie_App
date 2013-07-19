class MoviesController < ApplicationController
     
	before_action :load_movie, only: [:edit, :update, :show, :destroy]
	
	
	def index
		#@movies = Movie.all
		@movies = Movie.search_for(params[:query])
	end


	def show
	end
	
	
	def new
		@movie = Movie.new
	end
	
	
	def edit
	end
    
    
    def update
		#load_movie
		@movie.update movie_params
		
		#try and save
		if @movie.save
			redirect_to @movie
		else
			render :edit
		end
	end

	
	def create
		@movie = Movie.new(movie_params)
		
		#try and save
		if @movie.save
			redirect_to @movie
		else
			render :new 
		end
	end	


	def destroy	
		if @movie.destroy
			redirect_to movies_path
		else
			redirect_to @movie
		end
	end
    
    
    private
	
	def load_movie
		@movie = Movie.find(params[:id])
	end
	
	
	#require that they have a movie and get these attributes
	def movie_params
		params.require('movie').permit(:title, :description, :year_released, :ratings)
	end
    
    
end
