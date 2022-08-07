# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  firstname              :string
#  lastname               :string
#  callsign               :string
#  rating_id              :bigint
#  status                 :integer          default("inactive")
#  profile                :integer          default("pilot")
#  total_hours            :time             default(Sat, 01 Jan 2000 00:00:00.000000000 UTC +00:00)
#  total_flights          :integer          default(0)
#  landing_fps            :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  confirmation_token     :string(128)
#  remember_token         :string(128)
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :rating

  validates :rating, presence: true
  validates :callsign, length: { maximum: 7 }, presence: true
  validates :firstname, length: { maximum: 50 }
  validates :lastname, length: { maximum: 50 }

  enum profile: {
    pilot: 0,
    admin: 1,
    staff: 2
  }

  enum status: {
    inactive: 0,
    active: 1,
  }
end
