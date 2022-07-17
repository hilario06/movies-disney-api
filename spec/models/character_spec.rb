# == Schema Information
#
# Table name: characters
#
#  id         :bigint           not null, primary key
#  name       :string
#  age        :integer
#  weight     :float
#  story      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted_at :datetime
#
require 'rails_helper'

RSpec.describe Character, type: :model do
  describe 'Validaciones del personaje' do
    subject{ build(:character) }

    it 'Validar si nombre esta presente' do
      should validate_presence_of(:name)
    end

    it 'Validar si edad esta presente' do
      should validate_presence_of(:age)
    end

    it 'Validar si peso esta presente' do
      should validate_presence_of(:weight)
    end

    it 'Validar si historia esta presente' do
      should validate_presence_of(:story)
    end

    it 'validar si edad es un numero entero' do
      should validate_numericality_of(:age).only_integer
    end

    it 'validar si peso es un numero' do
      should validate_numericality_of(:weight)
    end

    it 'Validar si existe la relación con characters_movies' do
      should have_many(:characters_movies)
    end

    it 'Validar si existe la relación con movies' do
      should have_many(:movies)
    end
  end
end
