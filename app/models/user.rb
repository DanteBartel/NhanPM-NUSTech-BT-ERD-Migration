class User < ApplicationRecord
    validates :fname, :lname, :email, :pass, :no_photo, presence: true
    validates :fname, :lname, length: {maximum: 25}
    validates :email, length: {maximum: 255}
    validates :pass, length: {maximum: 64}
    validates :email, uniqueness: true
    validates :no_photo, :no_album, :no_following, :no_follower, numericality: {only_integer: true}
    validates :no_photo, :no_album, :no_following, :no_follower, comparison: {greater_than_or_equal_to: 0}
    validates :is_active, inclusion: {in: [true, false]}

    # Email format: prefix @ domain - this format is using the example from the internet
    validates :email, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/}

    # Association
    has_many :photos, dependent: :destroy
    has_many :albums, dependent: :destroy
    has_many :like_photos, dependent: :destroy
    has_many :like_albums, dependent: :destroy
    
end
