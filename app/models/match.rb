# frozen_string_literal: true

# == Schema Information
#
# Table name: matches
#
#  id           :integer          not null, primary key
#  away_score   :integer
#  home_score   :integer
#  kickoff_at   :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  away_team_id :integer
#  fixture_id   :integer
#  home_team_id :integer
#  stadium_id   :integer
#
# Indexes
#
#  index_matches_on_away_team_id  (away_team_id)
#  index_matches_on_fixture_id    (fixture_id)
#  index_matches_on_home_team_id  (home_team_id)
#  index_matches_on_stadium_id    (stadium_id)
#
# Foreign Keys
#
#  away_team_id  (away_team_id => teams.id)
#  home_team_id  (home_team_id => teams.id)
#  stadium_id    (stadium_id => stadiums.id)
#
class Match < ApplicationRecord
  belongs_to :fixture
  belongs_to :home_team, class_name: 'Team'
  belongs_to :away_team, class_name: 'Team'
  belongs_to :stadium
end
