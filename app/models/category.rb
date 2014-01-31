class Category < ActiveRecord::Base
  has_many :services
  accepts_nested_attributes_for :services
end
