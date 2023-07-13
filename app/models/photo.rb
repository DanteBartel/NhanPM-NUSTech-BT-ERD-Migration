class Photo < ApplicationRecord
    validates :title, :description, :photo, presence: true
    validates :title, length: {maximum: 140}
    validates :description, length: {maximum: 300}
    validates :is_public, inclusion: {in: [true, false]}

    # Association
    belongs_to :user, counter_cache: true
    has_many :like_photos, dependent: :destroy

    # Attach image with active storage
    has_one_attached :image do |attachable|
        attachable.variant :thumb, resize_to_limit: [100, 100]
    end
end
