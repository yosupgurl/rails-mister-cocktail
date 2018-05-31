# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

records = JSON.parse(open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read)



puts "Filling database with ingredients..."
for i in 0..15
  Ingredient.create(name: records["drinks"][i]['strIngredient1'])
  puts "#{records["drinks"][i]['strIngredient1']} Added to database!"
end
puts "Done!"

