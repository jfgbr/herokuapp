class Workday < ActiveRecord::Base
  has_many :weekly_schedules
  
  validates :text, presence: true
end
