class CheckoutValidator < ActiveModel::Validator
  def validate(record)
    record.checkin && record.checkout && unless record.checkout > record.checkin
      record.errors[:checkout] << "Checkout date must be after checkin"
    end
  end
end