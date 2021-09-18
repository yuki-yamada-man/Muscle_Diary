class TrainingFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :training

  validates_unqueness_of :training_id, scope: :user_id
end
