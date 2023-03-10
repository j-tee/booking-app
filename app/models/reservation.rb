class Reservation < ApplicationRecord
  belongs_to :doctor
  belongs_to :user

  validates :doctor_id, :user_id, :date, presence: true
  validates :date, uniqueness: true
  validate :date_cannot_be_in_the_past

  private

  def date_cannot_be_in_the_past
    return if date.blank? || date >= Date.today

    errors.add(:date, "can't be in the past")
  end
end
