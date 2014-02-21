class WeeklySchedule < ActiveRecord::Base
  belongs_to :employee, :class_name => "User", :foreign_key => "employee_id"
  belongs_to :worday
  has_many :schedules
  
  
  validates :employee_id, presence: true
  validates :workday_id, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
