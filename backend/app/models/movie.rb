class Movie < ApplicationRecord
  include Movies::Slug
  validates :name, presence: true, length: { minimum: 2 }
  validates :slug, uniqueness: true

  has_one_attached :poster
  before_save :set_slug
end
