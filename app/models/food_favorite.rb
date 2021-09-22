class FoodFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :food

  validates_uniqueness_of :food_id, scope: :user_id
end
