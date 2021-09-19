class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :trainings, dependent: :destroy
  has_many :foods, dependent: :destroy
  has_many :training_comments, dependent: :destroy
  has_many :food_comments, dependent: :destroy
  has_many :training_favorites, dependent: :destroy
  has_many :food_favorites,dependent: :destroy

  validates :name, presence:true, length:{minimum:2, maximum:20}, uniqueness:true
  validates :gender,presence:true
  validates :introduction, length:{maximum:50}

  attachment :image
end
