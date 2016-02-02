class Workspace < ActiveRecord::Base

  has_many :ratings, dependent: :destroy
  validates :name, length: {minimum: 1}

end
