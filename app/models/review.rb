class Review < ActiveRecord::Base
  belongs_to :reservation
  belongs_to :guest, :class_name => "User"
  validates :rating, :description, :reservation, presence: true
  include ActiveModel::Validations
  validates_with ReservationValidator
end
