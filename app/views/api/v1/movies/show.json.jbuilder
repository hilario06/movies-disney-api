json.partial! 'api/v1/movies/movie', movie: @movie
json.characters @movie.characters, partial: 'api/v1/characters/character', as: :character
