class Api::V1::CharactersController < ApplicationController
  before_action :authenticate_user!

  def index
    @characters = Character.all
    render :index, status: :ok
  end
end
