class Api::V1::CharactersController < ApplicationController
  before_action :authenticate_user!

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
  end

  private

  def character_params
    params.require(:character).permit(:name, :age, :weight, :story)
  end
end
