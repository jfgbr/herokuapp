class Appointment < ActiveRecord::Base
  belongs_to :client, :class_name => "User", :foreign_key => "client_id"
  #belongs_to :employee, :class_name => "User", :foreign_key => "employee_id"
  belongs_to :employee_service
  
  has_many :emplyees, :through => :employee_service
  #belongs_to :category
  #has_many :category_id, :through => :services
  
  #accepts_nested_attributes_for :services
  
  validates :client_id, presence: true
  #validates :employee_id, presence: true
  validates :service_id, presence: true
  validates :appointment_date, presence: true
end
