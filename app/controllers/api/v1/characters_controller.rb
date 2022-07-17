class Api::V1::CharactersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_character, only: %i[update destroy]

  def index
    @characters = Character.all
    render :index, status: :ok
  end

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
