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
require 'rails_helper'

RSpec.describe FsacarsConnection, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
