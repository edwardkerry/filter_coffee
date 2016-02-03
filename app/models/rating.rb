class Rating < ActiveRecord::Base
  belongs_to :workspace

  validates :wifi, inclusion: (1..5)
  validates :seating, inclusion: (1..5)
  validates :outlets, inclusion: (1..5)
  validates :noise, inclusion: (1..5)
end
