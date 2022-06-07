class PartyRecipe < ApplicationRecord
  belongs_to :recipe
  belongs_to :party
end
