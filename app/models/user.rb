class User < ApplicationRecord
    validates :fname, :lname, :email, :pass, :no_photo, presence: true
    validates :fname, :lname, length: {maximum: 25}
    validates :email, length: {maximum: 255}
    validates :pass, length: {maximum: 64}
    validates :email, uniqueness: true
    validates :no_photo, :no_album, :no_following, :no_follower, numericality: {only_integer: true}
    validates :no_photo, :no_album, :no_following, :no_follower, comparison: {greater_than_or_equal_to: 0}
    validates :is_active, inclusion: {in: [true, false]}

    # Email format: prefix @ domain
    validates :email, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/}

    # The content of the avatar has not been implemented yet, so its validation will be detailed later. :avatar has maximum size of 2Mb and must have format in [jpeg, png]
end
