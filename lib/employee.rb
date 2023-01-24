class Employee < ActiveRecord::Base
  belongs_to :store
  # Employees must always have a first name present
  # Employees must always have a last name present
  # Employees must always have a store that they belong to (can't have an employee that is not assigned a store)
  validates :first_name, :last_name, :store_id, presence: true
  # Employees have a hourly_rate that is a number (integer) between 40 and 200
  validates :hourly_rate, numericality: { greater_than: 40, less_than: 200 }
end
