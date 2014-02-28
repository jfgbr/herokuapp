class User < ActiveRecord::Base
  
  # id, name, email, admin, employee
  
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
  
  has_many :client_appointments, :class_name => "Appointment", inverse_of: :client_id
  has_many :employee_appointments, :class_name => "Appointment", inverse_of: :employee_id
  
  #has_many :employee_services
  #has_many :appointments, :foreign_key => "client_id"
  #belongs_to :appointments
  #has_many :client_appointments, :class_name => "Appointment", :foreign_key => "client_id"
  #has_many :employee_appointments, :class_name => "Appointment", :foreign_key => "employee_id"
  has_many :employee_services, :class_name => "EmployeeService", :foreign_key => "employee_id"
  #belongs_to :employee_service#, :class_name => "EmployeeService", :foreign_key => "employee_id", inverse_of: :user
  has_many :services, :through => :employee_services
  has_many :categories, :through => :services
  has_many :weekly_schedules, :class_name => "WeeklySchedule", :foreign_key => "employee_id"
  has_many :schedules, :class_name => "Schedule", :foreign_key => "employee_id", :through => :weekly_schedules
  has_many :workdays, :class_name => "Workday", :foreign_key => "workday_id", :through => :weekly_schedules
  
  #accepts_nested_attributes_for :appointments
  accepts_nested_attributes_for :employee_services
  accepts_nested_attributes_for :categories
  
  
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
