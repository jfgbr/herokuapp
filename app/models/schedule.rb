class Schedule < ActiveRecord::Base
  
  belongs_to :weekly_schedule
  belongs_to :schedule_type
  #has_many :appointments, :autosave => true
  
  validates :weekly_schedule_id, presence: true
  validates :schedule_type_id, presence: true
  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

end
