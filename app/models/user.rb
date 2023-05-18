class User < ApplicationRecord
  has_many :rankings

  validates :name, presence: true
  validates :email, presence: true
  validates :uuid, presence: true, uniqueness: true
  validates :token, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  def total_distance_traveled
    rankings.sum(&:distance_traveled)
  end
end
