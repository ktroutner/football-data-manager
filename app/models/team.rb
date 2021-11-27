# frozen_string_literal: true

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
