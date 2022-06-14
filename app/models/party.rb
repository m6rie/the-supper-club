class Party < ApplicationRecord
  has_many :party_recipes
  has_many :recipes, through: :party_recipes
  belongs_to :user
  has_many :party_themes
  has_many :themes, through: :party_themes
  has_many :party_dates

  def ingredients
    recipes.map(&:ingredients).flatten
  end
end
