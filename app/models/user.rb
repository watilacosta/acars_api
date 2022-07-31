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
#  status                 :integer          default(0)
#  profile                :integer          default(0)
#  total_hours            :time             default(Sat, 01 Jan 2000 00:00:00.000000000 UTC +00:00)
#  total_flights          :integer          default(0)
#  landing_fps            :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
