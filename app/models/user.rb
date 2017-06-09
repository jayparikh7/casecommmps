# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  first_name             :string
#  last_name              :string
#  photo                  :string
#  bio                    :text
#  phone                  :string
#  team_owner             :boolean
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  username               :string
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Associations
  has_many :messages_as_sender, :class_name => "Message", :foreign_key => "sender_id", :dependent => :destroy
  has_many :messages_as_receiver, :class_name => "Message", :foreign_key => "receiver_id", :dependent => :destroy
  has_many :teams, :foreign_key => "creator_id", :dependent => :destroy
  has_many :sent_invitations, :class_name => "Invitation", :foreign_key => "creator_id", :dependent => :destroy
  has_many :invitations_received, :class_name => "Invitation", :foreign_key => "member_id", :dependent => :destroy

  has_many :requested_teams, :through => :invitations_received, :source => :team

  # Validations


end
