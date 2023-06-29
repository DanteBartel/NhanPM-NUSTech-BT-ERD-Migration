class Photo < ApplicationRecord
    validates :title, :description, :photo, presence: true
    validates :title, length: {maximum: 140}
    validates :description, length: {maximum: 300}
    validates :is_public, inclusion: {in: [true, false]}
    validates :no_like, numericality: {only_integer: true}
    validates :no_like, comparison: {greater_than_or_equal_to: 0}

    # The content of the photo has not been implemented yet, so its validation will be detailed later.
    # :photo has maximum size of 5Mb and must have format in [jpeg, png, gif]
end
