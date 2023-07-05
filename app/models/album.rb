class Album < ApplicationRecord
    validates :title, :description, presence: true
    validates :title, length: {maximum: 140}
    validates :description, length: {maximum: 300}
    validates :is_public, inclusion: {in: [true, false]}
    validates :no_picture, comparison: {less_than_or_equal_to: 25}

    # Association
    belongs_to :user, counter_cache: true
    has_many :like_albums, dependent: :destroy
end
