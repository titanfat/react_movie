class MoviesController < ApplicationController
  before_action :find_movie, only: %i[show edit update destroy]
  def index
    @movies = Movie.released
  end

  def destroy
    @movie.destroy
    redirect_to root_path

  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
    redirect_to @movie
    else
      render :new
    end
  end

  def update
    if @movie.update(movie_params)
    redirect_to @movie, notice: "Movie succesfully update!"
    else
      render :edit
    end
  end

  private

  def movie_params
    params.require(:movie).permit!
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end

end
