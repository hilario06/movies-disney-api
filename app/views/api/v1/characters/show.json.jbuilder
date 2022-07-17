json.partial! 'api/v1/characters/character', character: @character
json.movies @character.movies, partial: 'api/v1/movies/movie', as: :movie
