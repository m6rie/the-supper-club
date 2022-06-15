class Theme < ApplicationRecord
  CATEGORY = %w[Tapas Indian Mexican Halloween Indian Mexican Thai Greek Italian American French Japanese Summer Vegan Vegetarian NYE Birthday Romantic]
  has_many :theme_parties
  has_many :parties, through: :theme_parties

  # belongs to :party
end
