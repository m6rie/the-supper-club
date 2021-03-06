class Recipe < ApplicationRecord
  has_many :party_recipes
  has_many :parties, through: :party_recipes
  has_many :user_recipes
  has_many :users, through: :user_recipes
end
