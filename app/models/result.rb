# == Schema Information
#
# Table name: results
#
#  id             :integer          not null, primary key
#  competition_id :integer
#  team_id        :integer
#  description    :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Result < ApplicationRecord

  # Associations

  belongs_to :competition
  belongs_to :team

  # Validations

  validates :competition_id,
            :team_id,
            :description, presence: true

end
