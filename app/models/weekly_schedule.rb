class WeeklySchedule < ActiveRecord::Base
  belongs_to :employee, :class_name => "User", :foreign_key => "employee_id"
  belongs_to :worday, :class_name => "Workday", :foreign_key => "workday_id"
  has_many :schedules#, :class_name => "Schedule", :foreign_key => "weekly_schedule_id"
  
  validates :employee_id, presence: true
  validates :workday_id, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
