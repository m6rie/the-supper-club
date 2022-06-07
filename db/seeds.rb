# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "destroying PartyRecipes..."
PartyRecipe.destroy_all
puts "destroying UserRecipes..."
UserRecipe.destroy_all
puts "destroying recipes..."
Party.destroy_all
puts "destroying users..."
Recipe.destroy_all
puts "destroying parties..."
User.destroy_all


puts "Creating Users..."

u1 = User.create!(name: 'Filipe', email:'filipe@gmail.com', password:'password', diet: 'Lactose Free')
u2 = User.create(name: 'Marie', email:'marie@gmail.com', password:'password', diet: 'Gluten Free')
u3 = User.create(name: 'Maria', email:'maria@gmail.com', password:'password', diet: 'Vegetarian')
u4 = User.create(name: 'Diandra', email:'diandra@gmail.com', password:'password', diet: 'No Pork')
u5 = User.create(name: 'Billy', email:'billy@gmail.com', password:'password', diet: 'Nuts Allergy')

puts "Created #{User.count} Users"

puts "Creating Recipes..."

r1 = Recipe.create(title:'Burritos Locos', description:'Easy to make and very spicy!', prep_time:15, ingredients:"Coriander, Tortillas, Chilli, Sweetcorn and Spicy Mayo", instructions: 'Just put everything inside the Tortillas and Roll!')
r2 = Recipe.create(title:'Sushi Rolls', description:'The best homemade Sushi', prep_time:50, ingredients:"Sushi Rice, Mayo, Soy Sauce, Smoked Salmon and Wasabi ", instructions: 'Cook Rice, and roll the sushi!')
r3 = Recipe.create(title:'Pizza Napolitana', description:'Authentic Neapolitan Pizza', prep_time:45, ingredients:"Flour, Tomato, Mozzarela, Parmesan, Olive Oil and Basil ", instructions: 'Lay the dough and then throw it in the air!')
r4 = Recipe.create(title:'Souvlaki Gyros', description:'Make your own traditional Greek pork souvlaki with gyros', prep_time:25, ingredients:"Pork, Garlic, Onion, Pita Bread, Tomato and Potatoes ", instructions: 'Put everything inside the pita bread!')
r5 = Recipe.create(title:'Marry Me Chicken', description:'She/He will marry you after eating this!', prep_time:45, ingredients:"Chicken Breast, Olive Oil, Garlic, Cheese, Heavy Cream and Fresh Basil ", instructions: 'Make it with Love for your Love one!')
r6 = Recipe.create(title:'Tarte Tatin', description:'Sweet and Sticky Caramel with Apples on top of Pastry', prep_time:20, ingredients:"Flour, Apples, Sugar, Butter and Creme Fraice", instructions: 'Cook a day or two ahead and oven it before serving')
r7 = Recipe.create(title:'Fancy Cupcakes', description:'Queen worthy Cupcakes', prep_time:60, ingredients:"Flour, Butter, Sugar, Vanilla Extract, Milk and Pink Fondant ", instructions: 'Just have to look fancy while doing it')
r8 = Recipe.create(title:'Ghost Bagels', description:'Spooky Bagels, Why not?', prep_time:55, ingredients:"Flour, Butter, Salmon and Cream Cheese ", instructions: 'Make Bread with a hole in it, open it, toast it and add filling.')

puts "Created #{Recipe.count} Recipes"

puts "Creating UserRecipes..."

ur1 = UserRecipe.create(user_id: u2.id, recipe_id: r1.id)
ur2 = UserRecipe.create(user_id: u1.id, recipe_id: r2.id)
ur3 = UserRecipe.create(user_id: u1.id, recipe_id: r3.id)
ur4 = UserRecipe.create(user_id: u3.id, recipe_id: r4.id)
ur5 = UserRecipe.create(user_id: u2.id, recipe_id: r5.id)
ur6 = UserRecipe.create(user_id: u2.id, recipe_id: r6.id)
ur7 = UserRecipe.create(user_id: u4.id, recipe_id: r7.id)
ur8 = UserRecipe.create(user_id: u4.id, recipe_id: r8.id)

puts "Created #{UserRecipe.count} UserRecipes"

puts "Creating Parties..."

p1 = Party.create!(title:'Mexican Fiesta', address: "Cancún", user_id: u3.id, recipe_id: r1.id)
p2 = Party.create(title:'Japanese Dinner', address: "Tokyo", user_id:u1.id, recipe_id: r2.id)
p3 = Party.create(title:'Cena Italiana', address: "Napoli", user_id:u1.id, recipe_id: r3.id)
p4 = Party.create(title:'Greek Feast', address: "Athens", user_id:u3.id, recipe_id: r4.id)
p5 = Party.create(title:'Romantic Dinner', address: "Paris", user_id:u2.id, recipe_id: r5.id)
p6 = Party.create(title:'French Finess', address: "Paris", user_id:u2.id, recipe_id: r6.id)
p7 = Party.create(title:'Brit Tea Party', address: "London", user_id:u4.id, recipe_id: r7.id)
p8 = Party.create(title:'Halloween Bagel Party', address: "London", user_id:u4.id, recipe_id: r8.id)

puts "Created #{Party.count} Parties"

puts "Creating PartyRecipes..."

pr1 = PartyRecipe.create!(recipe_id: r1.id, party_id: p1.id)
pr2 = PartyRecipe.create(recipe_id: r2.id, party_id: p2.id)
pr3 = PartyRecipe.create(recipe_id: r3.id, party_id: p3.id)
pr4 = PartyRecipe.create(recipe_id: r4.id, party_id: p4.id)
pr5 = PartyRecipe.create(recipe_id: r5.id, party_id: p5.id)
pr6 = PartyRecipe.create(recipe_id: r6.id, party_id: p6.id)
pr7 = PartyRecipe.create(recipe_id: r7.id, party_id: p7.id)
pr8 = PartyRecipe.create(recipe_id: r8.id, party_id: p8.id)

puts "Created #{PartyRecipe.count} PartyRecipes"
