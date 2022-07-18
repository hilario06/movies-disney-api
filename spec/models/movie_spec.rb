# == Schema Information
#
# Table name: movies
#
#  id            :bigint           not null, primary key
#  title         :string
#  creation_date :date
#  rating        :integer
#  genre_id      :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'Validaciones del de una pelicula' do
    subject{ build(:movie) }

    it 'Validar si titulo esta presente' do
      should validate_presence_of(:title)
    end

    it 'Validar si fecha de creación esta presente' do
      should validate_presence_of(:creation_date)
    end

    it 'Validar si rating esta presente' do
      should validate_presence_of(:rating)
    end

    it 'validar si edad es un numero entero' do
      should validate_numericality_of(:rating).only_integer
    end

    it 'Validar si existe la relación con characters_movies' do
      should have_many(:characters_movies)
    end

    it 'Validar si existe la relación con movies' do
      should have_many(:characters)
    end
  end
end
