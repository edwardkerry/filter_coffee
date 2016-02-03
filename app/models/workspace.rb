class Workspace < ActiveRecord::Base

  has_many :ratings, dependent: :destroy
  validates :name, length: {minimum: 1}
  geocoded_by :name
  after_validation :geocode

end
