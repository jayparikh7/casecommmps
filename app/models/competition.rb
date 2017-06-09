class Competition < ApplicationRecord

  # Associations

  has_many :results, :dependent => :destroy
  has_many :teams, :through => :results, :source => :team
end
