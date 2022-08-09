# == Schema Information
#
# Table name: fsacars_connections
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  pass       :string
#  auth       :string
#  version    :string
#  lat        :string
#  lon        :string
#  eqpt       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class FsacarsConnection < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
end
