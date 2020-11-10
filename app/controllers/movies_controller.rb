class MoviesController < ApplicationController

  def index
    @movie = [ "Железный человек", "Супермен" ,"Человек-паук" ]
  end
end
