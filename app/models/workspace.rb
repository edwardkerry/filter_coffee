class Workspace < ActiveRecord::Base

  has_many :ratings, dependent: :destroy
  validates :name, length: {minimum: 1}

  def average_rating(att)
    return "N/A" if ratings.none?
    ratings.average(att)
  end

  def overall_rating
    return "N/A" if ratings.none?
    calculate_attr_average
  end

  private

  def calculate_attr_average
    (self.average_rating(:wifi) + self.average_rating(:seating) + 
      self.average_rating(:outlets) + self.average_rating(:noise) + 
      self.average_rating(:coffee))/5
  end
end
