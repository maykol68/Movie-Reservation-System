class Movie < ApplicationRecord
    has_one_attached :poster

    validates :title, presence: true
    validates :description, presence: true
    validates :start_date, presence: true, uniqueness: true
    validates :end_date, presence: true, uniqueness: true
    
    belongs_to :genre
    has_many :showtimes
    has_many :reservations, through: :showtimes
end
