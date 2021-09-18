class Training < ApplicationRecord
  belongs_to :user
  has_many :training_comments, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  validates :menu, presence:true
  validates :kg, presence:true
  validates :count, presence:true
end
