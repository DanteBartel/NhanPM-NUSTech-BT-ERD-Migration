class User < ApplicationRecord
    # Testing devise so temporarily disable fname and lname validations
    # validates :fname, :lname, :email, presence: true
    validates :email, presence: true
    validates :fname, :lname, length: {maximum: 25}
    validates :email, length: {maximum: 255}
    validates :email, uniqueness: true
    validates :is_active, inclusion: {in: [true, false]}

    # Email format: prefix @ domain - this format is using the example from the internet
    validates :email, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/}

    # Association
    has_many :photos, dependent: :destroy
    has_many :albums, dependent: :destroy
    has_many :like_photos, dependent: :destroy
    has_many :like_albums, dependent: :destroy    

    # The associations to handle following relationships
    has_many :follows_as_follower, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
    has_many :follows_as_followee, class_name: "Follow", foreign_key: "followee_id", dependent: :destroy
    has_many :followers, through: :follows_as_followee, source: :follower
    has_many :followees, through: :follows_as_follower, source: :followee

    # Additional components for devise gem
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

    # Using active storage for avatar
    has_one_attached :avatar

    # Note: remember the max length of password is 64
end
