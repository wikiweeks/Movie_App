class MoviesController < ApplicationController
  def index
  	@movies = Movie.all
  end

   def show
	# @movie = Movie.find(params[:id])
	# @movie = Movie.find_by id=""
		@movie = Movie.find(params[:id])
  end 

  def new
  	@movie = Movie.new
	end

	# def create
	# render plain: params[:movie].inspect
 #  end

# below based on the forms creation guide
  def create
	  @movie = Movie.new(id_params)
	  if @movie.save
  		redirect_to @movie
		else
			render 'new'
		end
	end

	def edit
		@movie = Movie.find(params[:id])
	end

	def update
		@movie = Movie.find(params[:id])
		@movie.update_attributes(id_params)

		redirect_to @movie
	end
# for resolving security issues based on guide
private
  def id_params
    params.require(:movie).permit(:title, :description, :year_released)
  end
end
