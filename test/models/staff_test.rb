# frozen_string_literal: true

# == Schema Information
#
# Table name: staffs
#
#  id            :integer          not null, primary key
#  country       :integer          not null
#  date_of_birth :date
#  name          :string           not null
#  name_en       :string           not null
#  name_kana     :string           not null
#  prefecture    :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  player_id     :integer
#
# Indexes
#
#  index_staffs_on_player_id  (player_id)
#
# Foreign Keys
#
#  player_id  (player_id => players.id)
#
require 'test_helper'

class StaffTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
