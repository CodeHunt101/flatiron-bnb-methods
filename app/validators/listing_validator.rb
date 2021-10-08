class ListingValidator < ActiveModel::Validator
  def validate(record)
    record.checkin && record.checkout && unless record.listing.reservations.all? {|r| r.checkout < record.checkin || r.checkin > record.checkout}
      record.errors[:listing] << "Listing not available in that reservation span!"
    end
  end
end