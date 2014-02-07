class Appointment < ActiveRecord::Base
  
  #before_create {self.appointment_date = I18n.localize appointment_date, :format => :default}
  #before_save {self.appointment_date = I18n.localize appointment_date, :format => :default}
  #id, client_id, employee_service_id, appointment_date, paid
  
  belongs_to :client, :class_name => "User", :foreign_key => "client_id"
  belongs_to :employee, :class_name => "User", :foreign_key => "employee_id"
  belongs_to :service
  belongs_to :category
  
  #belongs_to :employee_service
  
  #has_many :employees, :through => :employee_service, :source => :user
  #has_many :services, :through => :employee_service
  
  #has_many :categories, :through => :services
  
  #accepts_nested_attributes_for :employee_service
  #accepts_nested_attributes_for :services
  
  validates :client_id, presence: true
  validates :employee_id, presence: true
  validates :category_id, presence: true
  validates :service_id, presence: true
  validates :appointment_date, presence: true
  validates :appointment_time, presence: true
end
