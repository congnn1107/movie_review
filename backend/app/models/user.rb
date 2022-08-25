class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include Users::Token

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  validates :name, allow_blank: false, length: { minimum: 5 }
  has_one_attached :avatar

  has_many :posts, dependent: :destroy
end
