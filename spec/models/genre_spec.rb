# == Schema Information
#
# Table name: genres
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Genre, type: :model do
  describe 'Validaciones del de una pelicula' do
    subject{ build(:genre) }

    it 'Validar si titulo esta presente' do
      should validate_presence_of(:name)
    end

    it 'Validar relacion con movies' do
      should have_many(:movies)
    end
  end
end
