class User < ApplicationRecord
  has_many :rankings

  validates :name, presence: true
  validates :email, presence: true
  validates :uuid, presence: true, uniqueness: true
  validates :token, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  scope :ranking_by_month_and_year, lambda { |month, year|
    return all if month.blank? || year.blank?

    joins(:rankings)
      .select('users.*, rankings.distance_traveled AS distance_traveled')
      .where(rankings: { month:, year: })
      .order('rankings.distance_traveled DESC')
  }

  def total_distance_traveled
    rankings.sum(&:distance_traveled)
  end
end
