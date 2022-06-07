class Theme < ApplicationRecord
  has_many :theme_parties
  has_many :parties, through: :theme_parties
end
