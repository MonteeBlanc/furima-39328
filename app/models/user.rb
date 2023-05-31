class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'must contain only full-width characters' }
  validates :name_katakana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid' }
  validates :surname, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'must contain only full-width characters' }
  validates :surname_katakana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid' }
  validates :date_of_birth, presence: true
  validates :password, presence: true, length: { minimum: 6, on: :create }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}\z/i, message: 'must contain at least one letter, one number, and consist of only alphanumeric characters' }

  has_many :products
  has_many :purchase_records
end