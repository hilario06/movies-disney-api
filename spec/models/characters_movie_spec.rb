# == Schema Information
#
# Table name: characters_movies
#
#  id           :bigint           not null, primary key
#  movie_id     :bigint           not null
#  character_id :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'rails_helper'

RSpec.describe CharactersMovie, type: :model do
  describe 'Validacion del model token' do
    subject { build(:characters_movie) }

    it 'Validar si existe relacion con movie' do
      should belong_to(:movie)
    end

    it 'Validar si existe relacion con movie' do
      should belong_to(:character)
    end
  end
end
