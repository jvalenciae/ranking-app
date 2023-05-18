class Ranking < ApplicationRecord
  belongs_to :user

  validates :month, presence: true
  validates :year, presence: true
  validates :distance_traveled, presence: true
  validates :month, inclusion: { in: 1..12 }
  validates :year, length: { is: 4 }
end
