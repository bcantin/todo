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
  
  acts_as_list
  
  belongs_to :project
  
  validates :description, :presence => true
  
  scope :completed,  where(:completed => true)
  scope :incomplete, where(:completed => false)
  scope :sorted,     order('position ASC')
  
end
