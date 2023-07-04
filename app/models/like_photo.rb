class LikePhoto < ApplicationRecord
    belongs_to :user
    belongs_to :photo, counter_cache: true
end
