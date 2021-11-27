# frozen_string_literal: true

# == Schema Information
#
# Table name: matches
#
#  id               :integer          not null, primary key
#  away_score       :integer
#  home_score       :integer
#  kickoff_at       :datetime
#  stadium          :string           not null
#  stadium_en       :string           not null
#  stadium_short    :string           not null
#  stadium_short_en :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  away_team_id     :integer
#  fixture_id       :integer
#  home_team_id     :integer
#
# Indexes
#
#  index_matches_on_away_team_id  (away_team_id)
#  index_matches_on_fixture_id    (fixture_id)
#  index_matches_on_home_team_id  (home_team_id)
#
# Foreign Keys
#
#  away_team_id  (away_team_id => teams.id)
#  home_team_id  (home_team_id => teams.id)
#
require 'test_helper'

class MatchTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
