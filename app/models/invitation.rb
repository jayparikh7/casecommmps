# == Schema Information
#
# Table name: invitations
#
#  id         :integer          not null, primary key
#  creator_id :integer
#  member_id  :integer
#  accepted   :boolean
#  team_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Invitation < ApplicationRecord

  # Associations
  belongs_to :creator, :class_name => "User"
  belongs_to :member, :class_name => "User"
  belongs_to :team

  # Validations

  validates :team_id,
            :creator_id,
            :member_id, presence: true

end
