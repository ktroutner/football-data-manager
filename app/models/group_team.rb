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
  belongs_to :group, class_name: 'LeagueGroup'
  belongs_to :team, class_name: 'CompetitionTeam'

  delegate :name, :short_name, to: :team

  def home_matches
    team.home_matches.joins(:fixture).where(fixture: { stage: group.league })
  end

  def away_matches
    team.away_matches.joins(:fixture).where(fixture: { stage: group.league })
  end

  def matches
    home_matches + away_matches
  end

  def home_wins(section = nil)
    home_matches.where('home_score > away_score').where(fixture: Matchday.section_n(section))
  end

  def home_losses(section = nil)
    home_matches.where('home_score < away_score').where(fixture: Matchday.section_n(section))
  end

  def home_draws(section = nil)
    home_matches.where('home_score = away_score').where(fixture: Matchday.section_n(section))
  end

  def away_wins(section = nil)
    away_matches.where('away_score > home_score').where(fixture: Matchday.section_n(section))
  end

  def away_losses(section = nil)
    away_matches.where('away_score < home_score').where(fixture: Matchday.section_n(section))
  end

  def away_draws(section = nil)
    away_matches.where('away_score = home_score').where(fixture: Matchday.section_n(section))
  end

  def wins(section = nil)
    home_wins(section) + away_wins(section)
  end

  def losses(section = nil)
    home_losses(section) + away_losses(section)
  end

  def draws(section = nil)
    home_draws(section) + away_draws(section)
  end

  def home_goals_for(section = nil)
    home_matches.where(fixture: Matchday.section_n(section)).pluck(:home_score).compact.sum
  end

  def home_goals_against(section = nil)
    home_matches.where(fixture: Matchday.section_n(section)).pluck(:away_score).compact.sum
  end

  def away_goals_for(section = nil)
    away_matches.where(fixture: Matchday.section_n(section)).pluck(:away_score).compact.sum
  end

  def away_goals_against(section = nil)
    away_matches.where(fixture: Matchday.section_n(section)).pluck(:home_score).compact.sum
  end

  def points(section = nil)
    (wins(section).count * 3) + draws(section).count
  end

  def goals_for(section = nil)
    home_goals_for(section) + away_goals_for(section)
  end

  def goals_against(section = nil)
    home_goals_against(section) + away_goals_against(section)
  end

  def goal_differential(section = nil)
    goals_for(section) - goals_against(section)
  end
end
