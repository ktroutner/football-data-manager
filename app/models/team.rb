class Team < ApplicationRecord
    belongs_to :season
    has_many :players
    has_many :colors, class_name: "TeamColor"
    has_many :home_matches, class_name: "Match", foreign_key: "home_team_id"
    has_many :away_matches, class_name: "Match", foreign_key: "away_team_id"

    class << self
        def matches
            home_matches.merge(away_matches)
        end
    end
end
