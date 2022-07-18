class Api::V1::MoviesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_movie, only: %i[update destroy]

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

  def update
    if @movie.update(movie_params)
      render :show, status: :ok
    else
      render json: { errors: @movie.errors.messages }, status: :bad_request
    end
  end

  def destroy
    @movie.destroy
    head :ok
  end

  def restore
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :creation_date, :rating, :genre_id)
  end

  def set_movie
    @movie = Movie.find(params[:id])
    head :not_found unless @movie
  end
end
