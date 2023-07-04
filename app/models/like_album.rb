class LikeAlbum < ApplicationRecord
    belongs_to :user
    belongs_to :album, counter_cache: true
end
