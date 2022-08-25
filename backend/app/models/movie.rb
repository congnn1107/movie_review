class Movie < ApplicationRecord
  include Slug
  validates :name, presence: true, length: { minimum: 2 }
  validates :slug, uniqueness: true

  has_one_attached :poster
  has_many :posts, dependent: :destroy

  before_save :set_slug
end
