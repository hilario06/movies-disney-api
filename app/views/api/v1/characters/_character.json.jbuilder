json.id character.id
json.name character.name
json.age character.age
json.weight character.weight
json.story character.story
if character.avatar.attached?
  json.url url_for(character.avatar)
else
  json.url ''
end
