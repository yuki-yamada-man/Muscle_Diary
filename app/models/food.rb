class Food < ApplicationRecord
  belongs_to :user
  has_many :food_comments, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  validates :menu, presence: true
end
