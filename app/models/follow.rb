class Follow < ApplicationRecord
    # The associations to handle following relationships
    belongs_to :follower, class_name: "User", counter_cache: :followees_count
    belongs_to :followee, class_name: "User", counter_cache: :followers_count
    # Validates the association
    validates :follower, presence: true
    validates :followee, presence: true
    validates :followee, uniqueness: {scope: [:follower, :followee]}
end
