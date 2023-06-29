class Album < ApplicationRecord
    validates :title, :description, presence: true
    validates :title, length: {maximum: 140}
    validates :description, length: {maximum: 300}
    validates :is_public, inclusion: {in: [true, false]}
    validates :no_picture, :no_like, numericality: {only_integer: true}
    validates :no_picture, :no_like, comparison: {greater_than_or_equal_to: 0}
    validates :no_picture, comparison: {less_than_or_equal_to: 25}
end
