class AlbumPicture < ApplicationRecord
    validates :picture, presence: true

    # The content of the album picture has not been implemented yet, so its validation will be detailed later. :picture has maximum size of 5Mb and must have format in [jpeg, png, gif]
end
