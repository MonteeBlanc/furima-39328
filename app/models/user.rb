class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'を全角で入力してください' }
  validates :name_katakana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'を全角入力してください' }
  validates :surname, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'で全角で入力してください' }
  validates :surname_katakana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'で全角入力してください' }
  validates :date_of_birth, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}\z/i, message: 'は少なくとも 1 つの文字と 1 つの数字を含み、英数字のみで構成される必要があります' }

  has_many :items
  has_many :purchase_records
end