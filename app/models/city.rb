class City < ActiveRecord::Base
  extend SharedMethods::ClassMethods
  has_many :neighborhoods
  has_many :listings, :through => :neighborhoods

  def city_openings(initial_date, final_date)
    results = []
    self.listings.each do |listing|
      results << listing if listing.reservations.all?{|r| initial_date.to_date > r.checkout || final_date.to_date < r.checkin }
    end
    results
  end
end

