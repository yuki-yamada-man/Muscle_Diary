class Training < ApplicationRecord
  belongs_to :user
  has_many :training_comments, dependent: :destroy
  has_many :training_favorites, dependent: :destroy

  def training_favorited_by?(user)
    training_favorites.where(user_id: user.id).exists?
  end

  validates :menu, presence:true
  validates :kg, presence:true
  validates :count, presence:true
end
