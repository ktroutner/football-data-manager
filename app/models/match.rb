# frozen_string_literal: true

# == Schema Information
#
# Table name: matches
#
#  id                   :integer          not null, primary key
#  away_score           :integer
#  home_score           :integer
#  kickoff_at           :datetime
#  status               :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  away_team_id         :integer
#  fixture_id           :integer          not null
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
class Match < ApplicationRecord
  belongs_to :fixture
  belongs_to :home_team, class_name: 'Team', optional: true
  belongs_to :away_team, class_name: 'Team', optional: true
  belongs_to :venue
  belongs_to :winner_next_match, class_name: 'Match', optional: true
  belongs_to :loser_next_match, class_name: 'Match', optional: true
  has_many :winner_previous_matches, class_name: 'Match', dependent: :nullify
  has_many :loser_previous_matches, class_name: 'Match', dependent: :nullify

  enum status: { not_started: 0, in_progress: 1, halftime: 2, complete: 3, stopped: 4, postponed: 5 },
       _prefix: true

  def display_score
    return 'v.' if status_not_started? || status_postponed? || home_score.nil? || away_score.nil?

    "#{home_score} - #{away_score}"
  end
end
