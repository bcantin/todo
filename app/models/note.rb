# == Schema Information
#
# Table name: notes
#
#  id          :integer         not null, primary key
#  description :text
#  project_id  :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Note < ActiveRecord::Base

  belongs_to :project

  validates :description, :presence => true

end
