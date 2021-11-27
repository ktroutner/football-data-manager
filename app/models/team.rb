# frozen_string_literal: true

# == Schema Information
#
# Table name: teams
#
#  id             :integer          not null, primary key
#  hometown       :string
#  hometown_en    :string
#  name           :string           not null
#  name_en        :string           not null
#  name_short     :string           not null
#  name_short_en  :string           not null
#  prefecture     :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  main_league_id :integer
#
# Indexes
#
#  index_teams_on_main_league_id  (main_league_id)
#
# Foreign Keys
#
#  main_league_id  (main_league_id => competitions.id)
#
class Team < ApplicationRecord
  has_many :players
  has_many :colors, class_name: 'TeamColor'
  has_many :home_matches, class_name: 'Match', foreign_key: 'home_team_id'
  has_many :away_matches, class_name: 'Match', foreign_key: 'away_team_id'
  has_many :memberships, class_name: 'SeasonMember'
  has_many :seasons, through: :memberships
  has_many :competitions, through: :seasons

  class << self
    def matches
      home_matches.merge(away_matches)
    end
  end
end
