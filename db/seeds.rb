# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# clean current database
puts "Cleaning the current database ..."
Recipe.destroy_all
Measure.destroy_all
Ingredient.destroy_all
Category.destroy_all


# ingredients seed
puts "Creating ingredients ..."
ingredients = %w(butter sugar flour egg oil vinegar onion garlic salt pepper chicken beef bread tomato salad corn potato beans)# ingredients seed

ingredients.each do |ingredient|
  Ingredient.create({name: ingredient})
  puts "  #{ingredient}"
end

# categories seed
puts "Creating categories ..."
categories = %W(Breakfast Breads\ &\ Rolls Appetizers Soups Meat
    Fish\ &\ Seafood Vegetables\ &\ Sides Salads Pies Cakes Cookies Desserts
    Candies\ &\ Jams Sauces\ &\ Rubs Ice\ Creams\ &\ Sorbets Miscellaneous)

categories.each do |category|
  Category.create({name: category})
  puts "  #{category}"
end

# measures seed
puts "Creating measures ..."
measures = %w(ounce pinch gram kilo pound teaspoon tablespoon cup quart gallon dash)

measures.each do |measure|
  Measure.create({name: measure})
  puts "  #{measure}"
end

# recipes seed
puts "Creating recipes ..."
recipes = %w(gloob blarg mlurp prums)

recipes.each do |recipe|
  Recipe.create({name: recipe, summary: "Recipe for #{recipe}", category: Category.find(rand(0..Category.size -1))})
  puts "  #{recipe}"
end
