# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# ingredients seed
puts "creating ingredients"
ingredients = %(butter, sugar, flour, egg, oil, vinegar, onion, garlic, salt, pepper, chicken breasts, ground beef, bread, tomato, salad, corn, potato, sweet potato, green pepper, red pepper, green beans, black beans)

ingredients.each do |ingredient|
  Ingredient.create({name: ingredient})
  puts ingredient
end

# measures seed
puts "creating measures"
measures = %(ounce, pinch, gram, kilo, pound, teaspoon, tablespoon, cup, quart, gallon, dash)

measures.each do |measure|
  Measure.create({name: measure})
  puts measure
end

# recipes seed
puts "creating recipes"
recipes = %(gloob, blarg, mlurp, prums)

recipes.each do |recipe|
  Recipe.create({name: recipe, summary: "Recipe for #{recipe}"})
  puts recipe
end
