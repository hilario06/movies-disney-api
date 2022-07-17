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
  pending "add some examples to (or delete) #{__FILE__}"
end
