class Rating < ActiveRecord::Base
  belongs_to :workspace
  belongs_to :user

  validates :wifi, inclusion: (1..5)
  validates :seating, inclusion: (1..5)
  validates :outlets, inclusion: (1..5)
  validates :noise, inclusion: (1..5)
  validates :coffee, inclusion: (1..5)
end
