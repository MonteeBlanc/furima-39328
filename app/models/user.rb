class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true
  validates :nickname, presence: true
  validates :name, presence: true
  validates :name_katakana, presence: true
  validates :surname, presence: true
  validates :surname_katakana, presence: true
  validates :date_of_birth, presence: true
  validates :password, length: { minimum: 6, on: :create } 

  has_many :products
  has_many :purchase_records
end
