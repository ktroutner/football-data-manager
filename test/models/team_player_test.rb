# frozen_string_literal: true

# == Schema Information
#
# Table name: team_players
#
#  id               :integer          not null, primary key
#  acquisition_type :integer          default("transfer"), not null
#  is_on_loan       :boolean          default(FALSE), not null
#  joined_on        :date             not null
#  left_on          :date
#  number           :integer          not null
#  position         :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  player_id        :integer          not null
#  team_id          :integer          not null
#
# Indexes
#
#  index_team_players_on_player_id  (player_id)
#  index_team_players_on_team_id    (team_id)
#
# Foreign Keys
#
#  player_id  (player_id => players.id)
#  team_id    (team_id => teams.id)
#
require 'test_helper'

class TeamPlayerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
