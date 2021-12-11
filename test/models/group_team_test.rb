# frozen_string_literal: true

# == Schema Information
#
# Table name: group_teams
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :integer          not null
#  team_id    :integer          not null
#
# Indexes
#
#  index_group_teams_on_group_id  (group_id)
#  index_group_teams_on_team_id   (team_id)
#
# Foreign Keys
#
#  group_id  (group_id => groups.id)
#  team_id   (team_id => competition_teams.id)
#
require 'test_helper'

class GroupTeamTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
