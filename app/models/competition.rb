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
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Competition < ApplicationRecord

  # Associations

  has_many :results, :dependent => :destroy
  has_many :teams, :foreign_key => "competitions_id", :dependent => :destroy
  has_many :teams_participate, :through => :results, :source => :team

  # Validations

  validates :name,
            :sponsor,
            :location, presence: true

end
