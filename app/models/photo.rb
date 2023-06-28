class Photo < ApplicationRecord
    validates :title, :description, :photo, :day_of_publish, :is_public, :no_like, presence: true
    validates :title, length: {maximum: 140}
    validates :description, length: {maximum: 300}
    validates :is_public, inclusion: {in: [true, false]}
    validates :no_like, numericality: {only_integer: true}
    validates :no_like, comparison: {greater_than_or_equal_to: 0}
end
