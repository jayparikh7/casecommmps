# == Schema Information
#
# Table name: teams
#
#  id              :integer          not null, primary key
#  creator_id      :integer
#  competitions_id :integer
#  name            :string
#  number_members  :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Team < ApplicationRecord

  # Associations

  belongs_to :creater, :class_name => "User", :foreign_key => "creator_id"
  belongs_to :competition, :foreign_key => "competitions_id"
  has_many :messages_to_team, :class_name => "Message", :dependent => :destroy
  has_many :results, :dependent => :destroy
  has_many :invitations, :dependent => :destroy

  has_many :members, :through => :invitations, :source => :member
  has_many :competition_results, :through => :results, :source => :competition

  # Validations

  validates :creator_id,
            :competitions_id,
            :name, presence: true

  validates :name, uniqueness: { scope: :competitions_id }

  validates :number_members, presence: true, numericality: true

end
