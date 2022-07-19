class Api::V1::MoviesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_movie, only: %i[update destroy show]

  def index
    search
    render :index, status: :ok
  end

  def search
    if params[:title].present?
      @movies = Movie.where("title ILIKE ?", "%#{params[:title]}%")
    elsif params[:genre_id].present?
      @movies = Movie.where(genre_id: params[:genre_id])
    elsif params[:order].present?
      # @movies = Movie.order("creation_date DESC")
      @movies = params[:order]=='desc' ? Movie.order(creation_date: :desc) : Movie.order(:creation_date)
    else
      @movies = Movie.all
    end
  end

  def show; end

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
    @movie = Movie.only_deleted.find(params[:movie_id])
    head :not_found unless @movie
    @movie.restore
    render :show, status: :ok
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
