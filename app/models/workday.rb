class Workday < ActiveRecord::Base
  has_many :weekly_schedules
  has_many :schedules, :class_name => "Schedule", :foreign_key => "workday_id", :through => :weekly_schedules
  
  validates :text, presence: true
end
