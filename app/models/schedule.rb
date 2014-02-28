class Schedule < ActiveRecord::Base
  
  belongs_to :weekly_schedule, :class_name => "WeeklySchedule", :foreign_key => "weekly_schedule_id"
  belongs_to :schedule_type
  belongs_to :worday
  #has_many :appointments, :autosave => true
  
  validates :weekly_schedule_id, presence: true
  validates :schedule_type_id, presence: true
  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

end
