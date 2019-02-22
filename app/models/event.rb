class Event < ApplicationRecord
  belongs_to :admin, class_name: "User"
  has_many :attendances

  validates :start_date, :duration, :title, :description, :price, :location, presence: true
  validates :duration, :numericality => { :greater_than => 0 }
	validates :title, length: { in: 5..140 }
	validates :description, length: { in: 20..1000 }
	validates :price, :inclusion => 1..1000
	validate :start_date_must_be_in_the_future
	validate :duration_is_multiple_of_five

	def start_date_must_be_in_the_future
		errors.add(:start_date, "must be before end time") unless start_date.present? && self.start_date.to_i > Time.now.to_i
	end

	def duration_is_multiple_of_five
    errors.add(:duration, "must be a multiple of 5") unless self.duration % 5 == 0
  end
end
