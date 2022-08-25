class Post < ApplicationRecord
  include Slug
  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true, on: :save
  has_one_attached :cover

  belongs_to :movie
  belongs_to :user

  before_save :set_slug

  scope :published, -> { where is_publish: true }

  def publish
    update_attribute(:is_publish, true)
    touch(:published_at)
  end
end
