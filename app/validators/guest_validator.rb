class GuestValidator < ActiveModel::Validator
  def validate(record)
    unless record.guest_id != record.listing.host_id
      record.errors[:guest] << "Guest cannot reserve their own listing!"
    end
  end
end