class Api::V1::CharactersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_character, only: %i[update destroy show]

  def index
    search
    render :index, status: :ok
  end

  def search
    if params[:name].present?
      @characters = Character.where("name ILIKE ?", "%#{params[:name]}%")
    elsif params[:age].present?
      @characters = Character.where(age: params[:age])
    elsif params[:movie_id].present?
      @characters = Character.joins(:characters_movies).where(characters_movies: {movie_id: params[:movie_id] })
    else
      @characters = Character.all
    end
  end

  def show; end

  def create
    @character = Character.new(character_params)
    if @character.valid?
      @character.save
      render :show, status: :created
    else
      render json: { errors: @character.errors.messages }, status: :bad_request
    end
  end

  def update
    if @character.update(character_params)
      render :show, status: :ok
    else
      render json: { errors: @character.errors.messages }, status: :bad_request
    end
  end

  def destroy
    @character.destroy
    head :ok
  end

  def restore
    @character = Character.only_deleted.find(params[:character_id])
    head :not_found unless @character
    @character.restore
    render :show, status: :ok
  end

  private

  def character_params
    params.require(:character).permit(:name, :age, :weight, :story)
  end

  def set_character
    @character = Character.find(params[:id])
    head :not_found unless @character
  end
end
