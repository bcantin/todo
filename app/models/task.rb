# == Schema Information
#
# Table name: tasks
#
#  id          :integer         not null, primary key
#  description :string(255)
#  completed   :boolean         default(FALSE)
#  project_id  :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Task < ActiveRecord::Base

  belongs_to :project
  
  validates :description, :presence => true
  
  scope :completed,  where(:completed => true)
  scope :incomplete, where(:completed => false)
  
end
