class Movie < ApplicationRecord
  has_many :actors

  has_many :movie_genres
  has_many :genres, through: :movie_genres

  # validates :title, length: { minimum: 2 }
  # validates :year, length: { minimum: 4 }
end
