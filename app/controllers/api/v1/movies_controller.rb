class Api::V1::MoviesController < ApplicationController
  before_action :authenticate_user!

  def index
    @movies = Movie.all
    render :index, status: :ok
  end
end
