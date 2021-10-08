class Listing < ActiveRecord::Base
  belongs_to :neighborhood
  belongs_to :host, :class_name => "User"
  has_many :reservations
  has_many :reviews, :through => :reservations
  has_many :guests, :class_name => "User", :through => :reservations
  
  validates :address, :listing_type, :title, :description, :price, :neighborhood_id, presence: true
  before_save :host_to_true
  after_destroy :host_to_false, if: :no_listings?

  def host_to_true
    # binding.pry
    self.host.update(host: true)
  end

  def host_to_false
    self.host.update(host: false)
  end

  def no_listings?
    self.host.listings.count == 0
  end

  def average_review_rating
    ratings = self.reservations.map{|r| r.review.rating}
    if ratings.size > 0
      ratings.reduce(:+).to_f/ratings.size
    end
  end
end
