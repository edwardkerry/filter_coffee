class Workspace < ActiveRecord::Base

  has_many :ratings, dependent: :destroy
  validates :name, length: {minimum: 1}

  def average_rating
    return "N/A" if ratings.none?
    ratings.average(:wifi)
  end
end
