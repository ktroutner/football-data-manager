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
#  group_id  (group_id => league_groups.id)
#  team_id   (team_id => competition_teams.id)
#
class GroupTeam < ApplicationRecord
  include TeamStatistics

  belongs_to :group, class_name: 'LeagueGroup'
  belongs_to :team, class_name: 'CompetitionTeam'

  delegate :name, :short_name, to: :team

  # override TeamStatistics#home_matches
  def home_matches(section = nil)
    team.home_matches.joins(:fixture).where(fixture: group.league.fixtures.merge(Matchday.section_n(section)))
  end

  # override TeamStatistics#away_matches
  def away_matches(section = nil)
    team.away_matches.joins(:fixture).where(fixture: group.league.fixtures.merge(Matchday.section_n(section)))
  end
end
