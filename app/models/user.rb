class User < ApplicationRecord
  
  attr_accessor :signin

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :organized_events, foreign_key: 'admin_id', class_name: "Event"
  has_many :attending_events, foreign_key: 'guest_id', class_name: "Attendance"
  has_many :attendances
  
  validates :username, :uniqueness => {:case_sensitive => false}
         
	def self.find_first_by_auth_conditions(warden_conditions)
 		conditions = warden_conditions.dup
 		if signin = conditions.delete(:signin)
 			where(conditions.to_hash).where("lower(username) = :value OR lower(email) = :value", value: signin.downcase).first
 		else
 			where(conditions.to_hash).first
 		end
	end
	
  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
