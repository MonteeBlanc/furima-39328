class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre, class_name: 'Genre', foreign_key: 'genre_id'

  validates :title, :text, presence: true
  validates :genre_id, numericality: { other_than: 1, message: "can't be blank" }
end
