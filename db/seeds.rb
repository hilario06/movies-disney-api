puts 'Initializing the seed...'

15.times do
  Genre.create(name: Faker::Book.genre)
end

# number genres
count_genres = Genre.count
30.times do
  Movie.create(
    title: Faker::Movie.title,
    creation_date: Faker::Date.between(from: '2000-01-01', to: '2021-12-31'),
    rating: rand(1..5),
    genre_id: rand(1..count_genres)
  )
end

# number movies
count_movies = Movie.count
30.times do
  character = Character.create(
    name: Faker::Name.name,
    age: rand(18..65),
    weight: rand(35.0..100).round(2),
    story: Faker::Lorem.sentence(word_count: 15, supplemental: true)
  )
  rand(1..4).times do
    CharactersMovie.create(
      character_id: character.id,
      movie_id: rand(1..count_movies)
    )
  end
end

puts 'Faked database created!'
