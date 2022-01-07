# frozen_string_literal: true

# == Schema Information
#
# Table name: team_players
#
#  id               :integer          not null, primary key
#  acquisition_type :integer
#  is_on_loan       :boolean
#  joined_on        :date             not null
#  left_on          :date
#  number           :integer
#  position         :integer
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
