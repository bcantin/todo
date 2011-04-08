class Task < ActiveRecord::Base

  belongs_to :project
  
  scope :completed,  where(:completed => true)
  scope :incomplete, where(:completed => false)
  
end
