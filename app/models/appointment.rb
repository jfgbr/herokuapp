class Appointment < ActiveRecord::Base
  
  #id, client_id, employee_service_id, appointment_date, paid
  
  belongs_to :client, :class_name => "User", :foreign_key => "client_id"
  #belongs_to :employee, :class_name => "User", :foreign_key => "employee_id"
  belongs_to :employee_service
  
  has_many :employees, :through => :employee_service
  has_many :services, :through => :employee_service
  #belongs_to :category
  #has_many :categories, :through => :services
  
  #accepts_nested_attributes_for :services
  
  validates :client_id, presence: true
  #validates :employee_id, presence: true
  validates :service_id, presence: true
  validates :appointment_date, presence: true
end
