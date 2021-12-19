# frozen_string_literal: true

# == Schema Information
#
# Table name: matches
#
#  id                   :integer          not null, primary key
#  away_pk              :integer
#  away_score           :integer
#  category             :integer
#  home_pk              :integer
#  home_score           :integer
#  kickoff_at           :datetime
#  status               :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  away_team_id         :integer
#  fixture_id           :integer
#  home_team_id         :integer
#  loser_next_match_id  :integer
#  venue_id             :integer
#  winner_next_match_id :integer
#
# Indexes
#
#  index_matches_on_away_team_id          (away_team_id)
#  index_matches_on_fixture_id            (fixture_id)
#  index_matches_on_home_team_id          (home_team_id)
#  index_matches_on_loser_next_match_id   (loser_next_match_id)
#  index_matches_on_venue_id              (venue_id)
#  index_matches_on_winner_next_match_id  (winner_next_match_id)
#
# Foreign Keys
#
#  away_team_id          (away_team_id => teams.id)
#  fixture_id            (fixture_id => fixtures.id)
#  home_team_id          (home_team_id => teams.id)
#  loser_next_match_id   (loser_next_match_id => matches.id)
#  venue_id              (venue_id => venues.id)
#  winner_next_match_id  (winner_next_match_id => matches.id)
#
require 'test_helper'

class MatchTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
