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

  # def self.highest_ratio_res_to_listings
  #   result = {}
  #   self.all.each do |city|
  #     res_amount = 0
  #     if city.listings.size >0 
  #       city.listings.each do |listing|
  #         res_amount += listing.reservations.size
  #       end
  #       result[city] = res_amount.to_f/city.listings.size
  #     end
      
  #   end
  #   result.max_by{|k,v| v}[0]
  # end

  # def self.most_res
  #   result = {}
  #   self.all.each do |city|
  #     res_amount = 0
  #       city.listings.each do |listing|
  #         res_amount += listing.reservations.size
  #       result[city] = res_amount.to_f
  #     end
      
  #   end
  #   result.max_by{|k,v| v}[0]
  # end
end
