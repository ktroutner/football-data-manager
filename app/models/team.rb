# frozen_string_literal: true

# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  end_year   :integer
#  start_year :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  club_id    :integer          not null
#
# Indexes
#
#  index_teams_on_club_id  (club_id)
#
# Foreign Keys
#
#  club_id  (club_id => clubs.id)
#
class Team < ApplicationRecord
  belongs_to :club
  belongs_to :main_league, class_name: 'League', optional: true
  has_many :competition_teams, dependent: :destroy
  has_many :competitions, through: :competition_teams
  has_many :home_matches, class_name: 'Match', foreign_key: :home_team_id, inverse_of: :home_team, dependent: :nullify
  has_many :away_matches, class_name: 'Match', foreign_key: :away_team_id, inverse_of: :away_team, dependent: :nullify
  has_many :team_players, dependent: :destroy
  has_many :players, -> { TeamPlayer.current }, class_name: 'Player', through: :team_players, source: :team
  has_many :team_players, dependent: :destroy
  has_many :players, through: :team_players
  has_many :former_team_players, -> { TeamPlayer.former },
           class_name: 'TeamPlayer', foreign_key: :team_id, inverse_of: :team, dependent: :destroy
  has_many :former_players, class_name: 'Player', through: :former_team_players, source: :player
  has_many :current_team_players, -> { TeamPlayer.current },
           class_name: 'TeamPlayer', foreign_key: :team_id, inverse_of: :team, dependent: :destroy
  has_many :current_players, class_name: 'Player', through: :current_team_players, source: :player

  delegate(
    :name,
    :short_name,
    :colors,
    :primary_color,
    :secondary_colors,
    :highlight_colors,
    to: :club
  )

  def display_year
    return start_year.to_s if end_year.nil? || end_year == start_year

    "#{start_year} - #{end_year}"
  end
end
