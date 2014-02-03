class User < ActiveRecord::Base
  before_create :create_remember_token
  before_save { self.email = email.downcase }
  
  validates :name, presence: true, length: { maximum: 50 }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
                    
  has_secure_password
  validates :password, length: { minimum: 6 }
  #validates_confirmation_of :password,
    #                      if: lambda { |m| m.password.present? }
  #has_many :employee_services
  belongs_to :appointments
  #has_many :client_appointments, :class_name => "Appointment", :foreign_key => "client_id"
  #has_many :employee_appointments, :class_name => "Appointment", :foreign_key => "employee_id"
  #has_many :employee_services, :class_name => "EmployeeService", :foreign_key => "employee_id"
  belongs_to :employee_service
  has_many :services, :through => :employee_service
  has_many :categories, :through => :services
  
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
  private

  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end
end
