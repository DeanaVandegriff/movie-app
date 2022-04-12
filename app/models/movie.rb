class Movie < ApplicationRecord
  has_many :actors
  has_many :movie_genres
  has_many :genres, through: :movie_genres
  validates :year, presence: true
  validates :title, presence: true
  validates :plot, presence: true
end
