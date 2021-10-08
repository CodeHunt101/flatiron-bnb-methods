class ReservationValidator < ActiveModel::Validator
  def validate(record)
    # binding.pry
    unless record.reservation && record.reservation.status == "accepted" && record.reservation.checkout <= Date.today
      record.errors[:reservation] << "Reservation has not been yet accepted!"
    end
  end
end