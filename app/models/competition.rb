# == Schema Information
#
# Table name: competitions
#
#  id          :integer          not null, primary key
#  name        :string
#  sponsor     :string
#  location    :string
#  description :text
#  prize_money :float
#  topic       :string
#  deadline    :datetime
#  teams       :boolean
#  max_teams   :boolean
#  max         :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Competition < ApplicationRecord

  # Associations

  has_many :results, :dependent => :destroy
  has_many :teams, :through => :results, :source => :team

  # Validations

  validates :name,
            :sponsor,
            :location,
            :deadline, presence: true

end
