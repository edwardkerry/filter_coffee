require 'net/http'

class Workspace < ActiveRecord::Base

  has_many :ratings, dependent: :destroy
  validates :name, length: {minimum: 1}
  geocoded_by :name
  after_validation :geocode

  def average_rating(att)
    return "N/A" if ratings.none?
    ratings.average(att)
  end

  def self.get_place_id(workspace)
    url = URI.parse("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{workspace.latitude},#{workspace.longitude}&rankby=distance&name=#{workspace.name}&types=establishment&key=AIzaSyAkk0WzkJl4oPNEYm6YbpXasQHRfHB3zSk")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE # You should use VERIFY_PEER in production
    request = Net::HTTP::Get.new(url.request_uri)
    res = http.request(request)
    puts res.body
  end

end
