class Theme < ApplicationRecord
  CATEGORY = %w[Tapas Indian Mexican Thai Greek Italian American French Japanese Summer Vegan/Vegetarian Christmas New-Years-Eve Formal Casual Tea 80s]
  has_many :theme_parties
  has_many :parties, through: :theme_parties
end
