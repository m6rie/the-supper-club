class Party < ApplicationRecord
  has_many :party_recipes, dependent: :destroy
  has_many :recipes, through: :party_recipes, dependent: :destroy
  belongs_to :user
  has_many :party_themes
  has_many :themes, through: :party_themes
  has_many :party_dates
  has_one_attached :photo

  def ingredients
    recipes.map(&:ingredients).flatten
  end
end
