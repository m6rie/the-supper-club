class Recipe < ApplicationRecord
  has_many :party_recipes
  has_many :parties, through: :party_recipes
  has_many :user_recipes
  has_many :users, through: :user_recipes
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
end
