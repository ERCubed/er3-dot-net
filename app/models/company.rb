class Company < ActiveRecord::Base
  attr_accessible :city, :end_date, :job_title, :name, :start_date, :state
  
  has_many :tasks
end
