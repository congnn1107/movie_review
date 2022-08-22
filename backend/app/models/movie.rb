class Movie < ApplicationRecord
    validates :name, presence: true, length: {minimum: 2}
    validates :slug, uniqueness: true
    
    has_one_attached :poster
end
