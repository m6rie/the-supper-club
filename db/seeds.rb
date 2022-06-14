# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "destroying Conversations..."
Conversation.destroy_all
puts "destroyin IngredientRecipes..."
RecipeIngredient.destroy_all
puts "destroying Ingredients..."
Ingredient.destroy_all
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

u1 = User.create!(name: 'Filipe', email: 'filipe@gmail.com', password: 'password', diet: 'Lactose Free')
u2 = User.create(name: 'Marie', email: 'marie@gmail.com', password: 'password', diet: 'Gluten Free')
u3 = User.create(name: 'Maria', email: 'maria@gmail.com', password: 'password', diet: 'Vegetarian')
u4 = User.create(name: 'Diandra', email: 'diandra@gmail.com', password: 'password', diet: 'No Pork')
u5 = User.create(name: 'Billy', email: 'billy@gmail.com', password: 'password', diet: 'Nuts Allergy')

puts "Created #{User.count} Users"

puts "Creating Recipes..."

r1 = Recipe.create(title: 'Burritos Locos',
                   description: 'Easy to make and very spicy!',
                   prep_time: 15,
                   #  ingredients: "Coriander, Tortillas, Chilli, Sweetcorn and Spicy Mayo.",
                   photo_url: 'https://images.rawpixel.com/image_1300/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA1L3BmLXM2Ni1tb25pa2EtY3VycnktY2hpY2tlbi10YWNvcy13aXRoLXZlZ2dpZXMtYW5kLWZyZXNoLWNvcmlhbmRlci0xYS5qcGc.jpg')
r2 = Recipe.create(title: 'Sushi Rolls',
                   description: 'The best homemade Sushi',
                   prep_time: 50,
                   #  ingredients: "Sushi Rice, Mayo, Soy Sauce, Smoked Salmon and Wasabi.",
                   photo_url: 'https://images.rawpixel.com/image_1300/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvbHIvcGYtbmFtZTYxOTYtbmFtZS1jaGltLmpwZw.jpg')
r3 = Recipe.create(title: 'Pizza Napolitana',
                   description: 'Authentic Neapolitan Pizza.',
                   prep_time: 45,
                   #  ingredients: "Flour, Tomato, Mozzarela, Parmesan, Olive Oil and Basil.",
                   photo_url: 'https://images.rawpixel.com/image_1300/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvbHIvcGYtZWRnYXJjYXN0cmVqb24yLW1hcmdoZXJpdGFwaXp6YS0wODQtYWUuanBn.jpg')
r4 = Recipe.create(title: 'Souvlaki Gyros',
                   description: 'Make your own traditional Greek pork souvlaki with gyros.',
                   prep_time: 25,
                   #  ingredients: "Pork, Garlic, Onion, Pita Bread, Tomato and Potatoes.",
                   photo_url: 'https://img.freepik.com/free-photo/gyros-souvlaki-wraps-pita-bread-with-chicken-potatoes-tzatziki-sauce_79830-1779.jpg')
r5 = Recipe.create(title: 'Marry Me Chicken',
                   description: 'She/He will marry you after eating this!',
                   prep_time: 45,
                   #  ingredients: "Chicken Breast, Olive Oil, Garlic, Cheese, Heavy Cream and Fresh Basil.",
                   photo_url: 'https://www.thespruceeats.com/thmb/Nagg1dO9v0MYzT8B0tB8xuCsafk=/1500x1000/filters:fill(auto,1)/marry-me-chicken-5225352-hero-06-dea1c6367dbe4dc38984552a39504b11.jpg')
r6 = Recipe.create(title: 'Tarte Tatin',
                   description: 'Sweet and Sticky Caramel with Apples on top of Pastry.',
                   prep_time: 20,
                   #  ingredients: "Flour, Apples, Sugar, Butter and Creme Fraice.",
                   photo_url: 'https://www.vzug.com/medias/sys_master/recipeimages/recipeimages/h53/h1f/9450096787486/recipe-img-slide.jpg')
r7 = Recipe.create(title: 'Fancy Cupcakes',
                   description: 'Queen worthy Cupcakes.',
                   prep_time: 60,
                   #  ingredients: "Flour, Butter, Sugar, Vanilla Extract, Milk and Pink Fondant.",
                   photo_url: 'https://images.squarespace-cdn.com/content/v1/5402e23ce4b0a7034afad3a2/1564664237026-L0WKZUT3AQT9VYV620UB/pink-gin-raspberry-lemon-cupcake.jpg')
r8 = Recipe.create(title: 'Ghost Bagels',
                   description: 'Spooky Bagels, because why not?',
                   prep_time: 55,
                   #  ingredients: "Flour, Butter, Salmon and Cream Cheese.",
                   photo_url: 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/ghost-bagels-1570113960.jpg')
r9 = Recipe.create(title: 'Tuna Salad',
                   description: 'salad composed primarily of chopped canned tuna fish. tuna fish salad. salad - food mixtures either arranged on a plate or tossed and served with a moist dressing; usually consisting of or including greens.',
                   prep_time: 25,
                   #  ingredients: "Lemons, Onions, Celery, Tuna, Capers, Bread and Lettuce.",
                   photo_url: 'https://3sg1ub4c9ujs3ydnjk3mgck0-wpengine.netdna-ssl.com/wp-content/uploads/2020/06/John-West-Final_Italian-Tuna-and-Mozzarella-Salad-with-Ciabatta_2160x960px.jpg')
r10 = Recipe.create(title: 'Clam Pasta with Spicy, Toasted Breadcrumbs',
                    description: 'Delicious linguine with authentic New Zealand clams in a garlic and butter sauce.',
                    prep_time: 40,
                    # ingredients: "Linguini, Olive Oil, Clams, Garlic, Lemon, Parsley, Red Pepper Flakes",
                    photo_url: 'https://cdn.whatsgabycooking.com/wp-content/uploads/2016/03/WGC-Linguine-with-Clams-2-copy-2.jpg')
r11 = Recipe.create(title: 'Beans with Beans',
                    description: "Beans with beans it's pretty straight forward, only for bean lovers.",
                    prep_time: 30,
                    # ingredients: "Beans, Olive Oil, Red Pepper Flakes, Anchovies, Garlic and Parsley",
                    photo_url: 'https://realfood.tesco.com/media/images/RFO-1400x919-CannelliniBeans-a8c72d1b-c0e6-4fbb-8f2e-3fc1c0e0624c-0-1400x919.jpg')
r12 = Recipe.create(title: 'Wine-Braised Chicken With Artichoke Hearts',
                    description: 'Heart-warming Chicken with beautiful and delicate artichokes hearts.',
                    prep_time: 45,
                    # ingredients: "Chicken, Red Onions, Dry White Whine, Oregano, Artichocke Hearts and Olive Oil.",
                    photo_url: 'https://images.squarespace-cdn.com/content/v1/541b1515e4b0a990b33a796e/1611257874220-LCJ8B1128CFDHCHUM2A6/alison-roman-cooking-wine-braised-chicken-with-artichoke-hearts.jpg?')
r13 = Recipe.create(title: 'Key Lime Pie',
                    description: "This is constantly a go-to, a crowd-pleaser (except for the one person who doesn't like limes, I guess!).",
                    prep_time: 50,
                    # ingredients: "Graham Crackers, Coconut Oil, Butter, Sugar, Eggs, Lime Juice and Heavy Cream.",
                    photo_url: 'https://static01.nyt.com/images/2019/05/09/dining/key-lime-pie-2/key-lime-pie-2-articleLarge.jpg')

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

p1 = Party.create!(title: 'Mexican Fiesta', address: "Cancún", theme: "Mexican", date: "21-06-2022", attendancy: 6, appetizers: 1, mains: 1, desserts: 1, user_id: u3.id)
p2 = Party.create(title: 'Japanese Dinner', address: "Tokyo", theme: "Japanese", date: "29-06-2022", attendancy: 4, appetizers: 1, mains: 1, desserts: 1, user_id: u1.id)
p3 = Party.create(title: 'Cena Italiana', address: "Napoli", theme: "Italian", date: "12-06-2022", attendancy: 4, appetizers: 1, mains: 1, desserts: 1, user_id: u1.id)
p4 = Party.create(title: 'Greek Feast', address: "Athens", theme: "Greek", date: "6-06-2022", attendancy: 8, appetizers: 1, mains: 1, desserts: 1, user_id: u3.id)
p5 = Party.create(title: 'Romantic Dinner', address: "Paris", theme: "Romantic", date: "8-06-2022", attendancy: 2, appetizers: 1, mains: 1, desserts: 1, user_id: u2.id)
p6 = Party.create(title: 'French Finess', address: "Paris", theme: "French", date: "3-06-2022", attendancy: 5, appetizers: 1, mains: 1, desserts: 1, user_id: u2.id)
p7 = Party.create(title: 'Brit Tea Party', address: "London", theme: "Tea", date: "26-06-2022", attendancy: 4, appetizers: 1, mains: 1, desserts: 1, user_id: u4.id)
p8 = Party.create(title: 'Halloween Bagel Party', address: "London", theme: "Halloween", date: "29-06-2022", attendancy: 9, appetizers: 1, mains: 1, desserts: 1, user_id: u4.id)

puts "Created #{Party.count} Parties"

puts "Creating PartyRecipes..."

PartyRecipe.create!(recipe_id: r1.id, party_id: p1.id)
PartyRecipe.create(recipe_id: r2.id, party_id: p2.id)
PartyRecipe.create(recipe_id: r3.id, party_id: p3.id)
PartyRecipe.create(recipe_id: r4.id, party_id: p4.id)
PartyRecipe.create(recipe_id: r5.id, party_id: p5.id)
PartyRecipe.create(recipe_id: r6.id, party_id: p6.id)
PartyRecipe.create(recipe_id: r7.id, party_id: p7.id)
PartyRecipe.create(recipe_id: r8.id, party_id: p8.id)
PartyRecipe.create(recipe_id: r9.id, party_id: p2.id)
PartyRecipe.create(recipe_id: r10.id, party_id: p3.id)
PartyRecipe.create(recipe_id: r11.id, party_id: p1.id)
PartyRecipe.create(recipe_id: r12.id, party_id: p6.id)
PartyRecipe.create(recipe_id: r13.id, party_id: p2.id)
PartyRecipe.create(recipe_id: r13.id, party_id: p1.id)
PartyRecipe.create(recipe_id: r13.id, party_id: p3.id)
PartyRecipe.create(recipe_id: r9.id, party_id: p4.id)
PartyRecipe.create(recipe_id: r11.id, party_id: p7.id)
PartyRecipe.create(recipe_id: r3.id, party_id: p8.id)
PartyRecipe.create(recipe_id: r13.id, party_id: p4.id)
PartyRecipe.create(recipe_id: r9.id, party_id: p5.id)
PartyRecipe.create(recipe_id: r7.id, party_id: p5.id)
PartyRecipe.create(recipe_id: r9.id, party_id: p6.id)
PartyRecipe.create(recipe_id: r12.id, party_id: p7.id)
PartyRecipe.create(recipe_id: r13.id, party_id: p8.id)

puts "Created #{PartyRecipe.count} PartyRecipes"

puts "Creating Ingredients..."
i1 = Ingredient.create(name: 'Graham Crackers')
i2 = Ingredient.create(name: 'Coconut Oil')
i3 = Ingredient.create(name: 'Butter')
i4 = Ingredient.create(name: 'Sugar')
i5 = Ingredient.create(name: 'Eggs')
i6 = Ingredient.create(name: 'Lime Juice')
i7 = Ingredient.create(name: 'Heavy Cream')
i8 = Ingredient.create(name: 'Lemons')
i9 = Ingredient.create(name: 'Onions')
i10 = Ingredient.create(name: 'Celery')
i11 = Ingredient.create(name: 'Tuna')
i12 = Ingredient.create(name: 'Capers')
i13 = Ingredient.create(name: 'Bread')
i14 = Ingredient.create(name: 'Lettuce')
i15 = Ingredient.create(name: 'Heavy Cream')
i16 = Ingredient.create(name: 'Sushi Rice')
i17 = Ingredient.create(name: 'Mayo')
i18 = Ingredient.create(name: 'Soy Sauce')
i19 = Ingredient.create(name: 'Smoked Salmon')
i20 = Ingredient.create(name: 'Wasabi')

puts "Created #{Ingredient.count} Ingredients"

puts "Creating Ingredient Recipes..."

RecipeIngredient.create(recipe_id: r13.id, ingredient_id: i1.id)
RecipeIngredient.create(recipe_id: r13.id, ingredient_id: i2.id)
RecipeIngredient.create(recipe_id: r13.id, ingredient_id: i3.id)
RecipeIngredient.create(recipe_id: r13.id, ingredient_id: i4.id)
RecipeIngredient.create(recipe_id: r13.id, ingredient_id: i5.id)
RecipeIngredient.create(recipe_id: r13.id, ingredient_id: i6.id)
RecipeIngredient.create(recipe_id: r13.id, ingredient_id: i7.id)
RecipeIngredient.create(recipe_id: r9.id, ingredient_id: i8.id)
RecipeIngredient.create(recipe_id: r9.id, ingredient_id: i9.id)
RecipeIngredient.create(recipe_id: r9.id, ingredient_id: i10.id)
RecipeIngredient.create(recipe_id: r9.id, ingredient_id: i11.id)
RecipeIngredient.create(recipe_id: r9.id, ingredient_id: i12.id)
RecipeIngredient.create(recipe_id: r9.id, ingredient_id: i13.id)
RecipeIngredient.create(recipe_id: r9.id, ingredient_id: i14.id)
RecipeIngredient.create(recipe_id: r9.id, ingredient_id: i15.id)
RecipeIngredient.create(recipe_id: r2.id, ingredient_id: i16.id)
RecipeIngredient.create(recipe_id: r2.id, ingredient_id: i17.id)
RecipeIngredient.create(recipe_id: r2.id, ingredient_id: i18.id)
RecipeIngredient.create(recipe_id: r2.id, ingredient_id: i19.id)
RecipeIngredient.create(recipe_id: r2.id, ingredient_id: i20.id)

puts "Created #{RecipeIngredient.count} Recipe Ingredients"

puts "Creating Conversations..."

Conversation.create(topic: "Travel", subject: "Where are you travelling next?")
Conversation.create(topic: "Travel", subject: "What was your favourite trip?")
Conversation.create(topic: "Travel", subject: "Where is your dream destination?")
Conversation.create(topic: "Travel", subject: "What's the best thing about traveling? How about the worst thing?")
Conversation.create(topic: "Travel", subject: "Where is the most awe-inspiring place you have been?")
Conversation.create(topic: "Travel", subject: "If you could live anywhere in the world, where would it be?”")
Conversation.create(topic: "Travel", subject: "What's the best way to travel? (Plane, car, train, etc.)")
Conversation.create(topic: "Travel", subject: "Where is the most relaxing place you have been?")
Conversation.create(topic: "Travel", subject: "Do you prefer traveling alone or with a group?")
Conversation.create(topic: "Travel", subject: "What is the worst hotel you have stayed at? How about the best hotel?")
Conversation.create(topic: "Travel", subject: "Talk about some of the interesting people you have met while traveling.")
Conversation.create(topic: "Travel", subject: "What do you think of staycations? (Vacationing and seeing tourist attractions where you live.)")
Conversation.create(topic: "Connection", subject: "What is your guilty pleasure?")
Conversation.create(topic: "Connection", subject: "What do you do to improve your mood when you are in a bad mood?")
Conversation.create(topic: "Connection", subject: "What's your favorite food?")
Conversation.create(topic: "Connection", subject: "What do you look for in a guy/girl?")
Conversation.create(topic: "Connection", subject: "When do you want to retire? What do you want to do when you retire?")
Conversation.create(topic: "Connection", subject: "What did you do this past weekend?")
Conversation.create(topic: "Connection", subject: "Are you a Dog or Cat person?")
Conversation.create(topic: "Tv/Cinema", subject: "What's the worst movie you have seen recently?")
Conversation.create(topic: "Tv/Cinema", subject: "What is the funniest movie you have ever seen?")
Conversation.create(topic: "Tv/Cinema", subject: "What's the best show currently on TV?")
Conversation.create(topic: "Tv/Cinema", subject: "What's the best sitcom?")
Conversation.create(topic: "Tv/Cinema", subject: "What cartoons did you watch as a child?")
Conversation.create(topic: "Tv/Cinema", subject: "If you could bring back one TV show that was canceled, which one would you bring back?")
Conversation.create(topic: "Tv/Cinema", subject: "What do you think about reality TV? Why do you think it’s so popular?")
Conversation.create(topic: "Tv/Cinema", subject: "Favourite Actor/Actress?")
Conversation.create(topic: "Music", subject: "Records, tapes, CDs, MP3s, streaming. Which did you grow up with? What is good and bad about each?")
Conversation.create(topic: "Music", subject: "Do you like going to concerts? Why or why not? What was the last concert you went to?")
Conversation.create(topic: "Music", subject: "Favourite music genre?")
Conversation.create(topic: "Music", subject: "Best Music Festival you have been to?")
Conversation.create(topic: "Music", subject: "What's the best way to discover new music?")
Conversation.create(topic: "Music", subject: "What bands or types of music do you listen to when you exercise?")
Conversation.create(topic: "Music", subject: "Who was the first band or musician you were really into? Do you still like them?")
Conversation.create(topic: "Art", subject: "What was your favourite museum?")
Conversation.create(topic: "Art", subject: "What famous artist (Dead or Alive) would you want to paint your portrait?")
Conversation.create(topic: "Art", subject: "If you could have any piece of art in your living room, what would it be?")
Conversation.create(topic: "Art", subject: "What is the purpose of art in society?")
Conversation.create(topic: "Art", subject: "Do you prefere Painting or Sculpture?")
Conversation.create(topic: "Art", subject: "Do you think that anything can be considered art?")
Conversation.create(topic: "Art", subject: "What kind of art do you enjoy most?")
Conversation.create(topic: "World", subject: "What would you change to make the world a better place?")
Conversation.create(topic: "World", subject: "Do you get involved in Politics?")
Conversation.create(topic: "World", subject: "What country impresses you the most in terms of structure and organization?")
Conversation.create(topic: "World", subject: "Name 3 things in nature you find most beautiful?")
Conversation.create(topic: "World", subject: "What is the most uplifting thing happening in the world right now? What is the most tragic thing?")
Conversation.create(topic: "World", subject: "What are the most important factors in maintaining a well functioning society? What does it mean for a society to function well?")
Conversation.create(topic: "Trends", subject: "Did you support Johnny Depp or Amber Heard?")
Conversation.create(topic: "Trends", subject: "What fashion trend do you wish would come back?")
Conversation.create(topic: "Trends", subject: "What fashion trend do you wish would go away?")
Conversation.create(topic: "Trends", subject: "Tik Tok or Instagram?")
Conversation.create(topic: "Trends", subject: "What are your thoughts on Augmented Reality and Virtual Reality?")
Conversation.create(topic: "Trends", subject: "What are your thoughts on Elon Musk buying Twitter?")
Conversation.create(topic: "Random", subject: "If you could go back in time 1,000 years, what year would you visit?")
Conversation.create(topic: "Random", subject: "What two languages would you like to be fluent in?")
Conversation.create(topic: "Random", subject: "If someone wrote a biography about you, what do you think the title should be?")
Conversation.create(topic: "Random", subject: "If you could trade lives with anyone for a day who would it be and why?")
Conversation.create(topic: "Random", subject: "If you could have one superpower, what would it be and why?")
Conversation.create(topic: "Random", subject: "What is the strangest thing you've ever eaten?")
Conversation.create(topic: "Random", subject: "What's the dumbest thing you've ever cried about?")
Conversation.create(topic: "Random", subject: "What are the top two most used apps on your phone?")
Conversation.create(topic: "Would you rather", subject: "Would you rather lose the ability to read or lose the ability to speak?")
Conversation.create(topic: "Would you rather", subject: "Would you rather be in jail for a year or lose a year off your life?")
Conversation.create(topic: "Would you rather", subject: "Would you rather have an easy job working for someone else or work for yourself but work incredibly hard?")
Conversation.create(topic: "Would you rather", subject: "Would you rather be the first person to explore a planet or be the inventor of a drug that cures a deadly disease?")
Conversation.create(topic: "Would you rather", subject: "Would you rather be born again in the same country or a different one of your choosing?")
Conversation.create(topic: "Would you rather", subject: "Would you rather give up using a phone or tablet forever or give up having any salt in food?")
Conversation.create(topic: "Would you rather", subject: "Would you rather never be able to drink water again or only be able to drink water?")
Conversation.create(topic: "Would you rather", subject: "Would you rather be a successful artist or a successful business owner?")
Conversation.create(topic: "Would you rather", subject: "Would you rather be compelled to high five everyone you meet or be compelled to give wedgies to anyone in a green shirt?")
Conversation.create(topic: "Would you rather", subject: "Would you rather only be able to wear clown shoes or not be able to wear any shoes?")
Conversation.create(topic: "Would you rather", subject: "Would you rather be able to teleport anywhere or be able to read minds?")
Conversation.create(topic: "Would you rather", subject: "Would you rather be forced to eat only spicy food or only incredibly bland food?")
Conversation.create(topic: "Tech", subject: "What was for you the best invention of the last 50 years?")
Conversation.create(topic: "Tech", subject: "Does technology simplify life or make it more complicated?")
Conversation.create(topic: "Tech", subject: "Which emerging technology are you most excited about?")
Conversation.create(topic: "Tech", subject: "Can you think of any technology that has only made the world worse? How about a piece of technology that has only made the world better?")
Conversation.create(topic: "Tech", subject: "What is your favorite piece of technology that you own?")
Conversation.create(topic: "Tech", subject: "Will technology save the human race or destroy it?")

puts "Created #{Conversation.count} Conversations"
