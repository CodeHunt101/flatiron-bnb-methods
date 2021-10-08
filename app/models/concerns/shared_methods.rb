require "active_support/concern"

module SharedMethods
  extend ActiveSupport::Concern

  # included do
  #   scope :public, -> { where(…) }
  # end

  # def is_public?
  #   # your code
  # end

  module ClassMethods
  
    def highest_ratio_res_to_listings
      result = {}
      self.all.each do |city|
        res_amount = 0
        if city.listings.size >0 
          city.listings.each do |listing|
            res_amount += listing.reservations.size
          end
          result[city] = res_amount.to_f/city.listings.size
        end
        
      end
      result.max_by{|k,v| v}[0]
    end
  
    def most_res
      result = {}
      self.all.each do |city|
        res_amount = 0
          city.listings.each do |listing|
            res_amount += listing.reservations.size
          result[city] = res_amount.to_f
        end
        
      end
      result.max_by{|k,v| v}[0]
    end
  end
end