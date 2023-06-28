class AlbumPicture < ApplicationRecord
    validates :picture, presence: true
end
