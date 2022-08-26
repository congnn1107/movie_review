class Post < ApplicationRecord
  include Slug
  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true, on: :save
  has_one_attached :cover

  has_many :votes
  belongs_to :movie
  belongs_to :user
  before_save :set_slug

  scope :published, -> { where is_publish: true }

  @@default_param = :slug

  def publish
    update_attribute(:is_publish, true)
    touch(:published_at)
  end

  def to_param
    self.send(@@default_param)
  end

  def self.set_default_param(name = :id)
    @@default_param = name
  end
end
