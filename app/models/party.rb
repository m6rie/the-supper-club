class Party < ApplicationRecord
  has_many :party_recipes
  has_many :recipes, through: :party_recipe
  belongs_to :user
  has_many :party_themes
  has_many :themes, through: :party_themes
  belongs_to :party_date
end
