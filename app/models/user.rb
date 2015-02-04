class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :instruments, :city, :state, :address,
                  :first_name, :last_name, :email, :password,
                  :password_confirmation

  serialize(:instruments, Array)

  validates :first_name, presence: true
  validates :last_name,  presence: true

  def location
    if incomplete_location
      "No address given"
    else
      "#{address}, #{city}, #{state}"
    end
  end

  def incomplete_location
    address.blank? || state.blank? || city.blank?
  end
end
