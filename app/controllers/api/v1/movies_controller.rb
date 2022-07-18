class Api::V1::MoviesController < ApplicationController
  before_action :authenticate_user!

  def index
    @movies = Movie.all
    render :index, status: :ok
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.valid?
      @movie.save
      render :show, status: :created
    else
      render json: { errors: @movie.errors.messages }, status: :bad_request
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :creation_date, :rating, :genre_id)
  end
end
