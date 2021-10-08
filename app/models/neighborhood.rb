class Neighborhood < ActiveRecord::Base
  extend SharedMethods::ClassMethods
  belongs_to :city
  has_many :listings

  def neighborhood_openings(initial_date, final_date)
    results = []
    self.listings.each do |listing|
      results << listing if listing.reservations.all?{|r| initial_date.to_date > r.checkout || final_date.to_date < r.checkin }
    end
    results
  end
end
