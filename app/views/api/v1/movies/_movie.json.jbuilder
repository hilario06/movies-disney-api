json.id movie.id
json.title movie.title
json.creation_date movie.creation_date
json.rating movie.rating
json.genre_id movie.genre_id
if movie.image.attached?
  json.url url_for(movie.image)
else
  json.url ''
end
