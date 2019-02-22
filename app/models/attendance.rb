class Attendance < ApplicationRecord
  belongs_to :guest, class_name: "User"
  belongs_to :event

  validates :stripe_customer_id, presence: { message: "You need to fill all the fields!" }

  after_create :attendance_send

  def attendance_send
    EventMailer.attendance_email(self).deliver_now
  end
end
