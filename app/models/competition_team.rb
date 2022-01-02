# frozen_string_literal: true

# == Schema Information
#
# Table name: competition_teams
#
#  id             :integer          not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  competition_id :integer          not null
#  team_id        :integer          not null
#
# Indexes
#
#  index_competition_teams_on_competition_id  (competition_id)
#  index_competition_teams_on_team_id         (team_id)
#
# Foreign Keys
#
#  competition_id  (competition_id => competitions.id)
#  team_id         (team_id => teams.id)
#
class CompetitionTeam < ApplicationRecord
  include TeamStatistics

  belongs_to :competition
  belongs_to :team
  has_many :group_teams, foreign_key: :team_id, inverse_of: :competition_team, dependent: :destroy

  delegate(
    :name,
    :short_name,
    :home_matches,
    :away_matches,
    to: :team
  )

  # override TeamStatistics#home_matches
  def home_matches(_section = nil)
    team.home_matches.joins(:fixture).where(fixture: { stage: competition.stages })
  end

  # override TeamStatistics#away_matches
  def away_matches(_section = nil)
    team.away_matches.joins(:fixture).where(fixture: { stage: competition.stages })
  end
end
