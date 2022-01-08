# frozen_string_literal: true

# == Schema Information
#
# Table name: team_staffs
#
#  id         :integer          not null, primary key
#  joined_on  :date             not null
#  left_on    :date
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  staff_id   :integer          not null
#  team_id    :integer          not null
#
# Indexes
#
#  index_team_staffs_on_staff_id  (staff_id)
#  index_team_staffs_on_team_id   (team_id)
#
# Foreign Keys
#
#  staff_id  (staff_id => staffs.id)
#  team_id   (team_id => teams.id)
#
require 'test_helper'

class TeamStaffTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
