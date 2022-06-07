class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :parties
  has_many :user_recipes
  has_many :recipes, through: :user_recipes

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
