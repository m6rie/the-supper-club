# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Creating Users..."

u1 = User.create(email:'filipe@gmail.com', password:'password')
u2 = User.create(email:'marie@gmail.com', password:'password')
u3 = User.create(email:'filipe@gmail.com', password:'password')
u4 = User.create(email:'diandra@gmail.com', password:'password')
u5 = User.create(email:'billy@gmail.com', password:'password')

puts "Created #{User.count} Users"

puts "Creating Recipes..."

r1 = Recipe.create(title:'Burritos Locos', description:'Easy to make and very spicy!', prep_time:15, ingredients:"Coriander, Tortillas, Chilli, Sweetcorn and Spicy Mayo", instructions: 'Just put everything inside the Tortillas and Roll!')
r2 = Recipe.create(title:'Sushi Rolls', description:'The best homemade Sushi', prep_time:50, ingredients:"Sushi Rice, Mayo, Soy Sauce, Smoked Salmon and Wasabi ", instructions: 'Cook Rice, and roll the sushi!')
r3 = Recipe.create(title:'Pizza Napolitana', description:'Authentic Neapolitan Pizza', prep_time:45, ingredients:"Flour, Tomato, Mozzarela, Parmesan, Olive Oil and Basil ", instructions: 'Lay the dough and then throw it in the air!')
r4 = Recipe.create(title:'Sushi Rolls', description:'Make your own traditional Greek pork souvlaki with gyros', prep_time:25, ingredients:"Pork, Garlic, Onion, Pita Bread, Tomato and Potatoes ", instructions: 'Put everything inside the pita bread!')
r5 = Recipe.create(title:'Marry Me Chicken', description:'She/He will marry you after eating this!', prep_time:45, ingredients:"Chicken Breast, Olive Oil, Garlic, Cheese, Heavy Cream and Fresh Basil ", instructions: 'Make it with Love for your Love one!')
r6 = Recipe.create(title:'Tarte Tatin', description:'Sweet and Sticky Caramel with Apples on top of Pastry', prep_time:20, ingredients:"Flour, Apples, Sugar, Butter and Creme Fraice", instructions: 'Cook a day or two ahead and oven it before serving')
r7 = Recipe.create(title:'Fancy Cupcakes', description:'Queen worthy Cupcakes', prep_time:60, ingredients:"Flour, Butter, Sugar, Vanilla Extract, Milk and Pink Fondant ", instructions: 'Just have to look fancy while doing it')
r8 = Recipe.create(title:'Ghost Bagels', description:'Spooky Bagels, Why not?', prep_time:55, ingredients:"Flour, Butter, Salmon and Cream Cheese ", instructions: 'Make Bread with a hole in it, open it, toast it and add filling.')

puts "Created #{Recipe.count} Recipes"

puts "Creating UserRecipes..."

ur1 = UserRecipe.create(user_id: u2, recipe_id: r1)
ur2 = UserRecipe.create(user_id: u1, recipe_id: r2)
ur3 = UserRecipe.create(user_id: u1, recipe_id: r3)
ur4 = UserRecipe.create(user_id: u3, recipe_id: r4)
ur5 = UserRecipe.create(user_id: u2, recipe_id: r5)
ur6 = UserRecipe.create(user_id: u2, recipe_id: r6)
ur7 = UserRecipe.create(user_id: u4, recipe_id: r7)
ur8 = UserRecipe.create(user_id: u4, recipe_id: r8)

puts "Created #{UserRecipe.count} UserRecipes"

puts "Creating Parties..."

p1 = Party.create(title:'Mexican Fiesta', address: "Cancún", user_id:3)
p2 = Party.create(title:'Japanese Dinner', address: "Tokyo", user_id:1)
p3 = Party.create(title:'Cena Italiana', address: "Napoli", user_id:1)
p4 = Party.create(title:'Greek Feast', address: "Athens", user_id:3)
p5 = Party.create(title:'Romantic Dinner', address: "Paris", user_id:2)
p6 = Party.create(title:'French Finess', address: "Paris", user_id:2)
p7 = Party.create(title:'Brit Tea Party', address: "London", user_id:4)
p8 = Party.create(title:'Halloween Bagel Party', address: "London", user_id:4)

puts "Created #{Party.count} Parties"

puts "Creating PartyRecipes..."

pr1 = PartyRecipe.create(recipe_id: r1, party_id: p1)
pr2 = PartyRecipe.create(recipe_id: r2, party_id: p2)
pr3 = PartyRecipe.create(recipe_id: r3, party_id: p3)
pr4 = PartyRecipe.create(recipe_id: r4, party_id: p4)
pr5 = PartyRecipe.create(recipe_id: r5, party_id: p5)
pr6 = PartyRecipe.create(recipe_id: r6, party_id: p6)
pr7 = PartyRecipe.create(recipe_id: r7, party_id: p7)
pr8 = PartyRecipe.create(recipe_id: r8, party_id: p8)

puts "Created #{PartyRecipes.count} PartyRecipes"
