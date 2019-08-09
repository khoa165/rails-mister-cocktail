# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'


puts 'Cleaning database...'
Cocktail.destroy_all
Ingredient.destroy_all
Dose.destroy_all

puts 'Creating ingredients...'
url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
json_file = open(url).read
result = JSON.parse(json_file)

drinks = result["drinks"]
drinks.each do |drink|
  Ingredient.create(name: drink["strIngredient1"])
end

puts 'Creating cocktails and doses...'
5.times do
  url = "http://static.giantbomb.com/uploads/original/9/99864/2419866-nes_console_set.png"
  cocktail = Cocktail.create(name: Faker::Coffee.blend_name)
  cocktail.remote_photo_url = url
  cocktail.save
  Random.rand(8..10).times do
    dose = Dose.create(description: Faker::Lorem.paragraph(sentence_count: Random.rand(4..6), supplemental: true, random_sentences_to_add: 5))
    dose.ingredient = Ingredient.all.sample
    dose.cocktail = cocktail
    dose.save
  end
end

puts 'Finished!'
