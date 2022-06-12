class Theme < ApplicationRecord
  CATEGORY = %w[Tapas Romantic Halloween Indian Mexican Thai Greek Italian American French Japanese Summer Vegan/Vegetarian NYE Birthday None]
  has_many :theme_parties
  has_many :parties, through: :theme_parties
end
