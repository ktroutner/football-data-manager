class SeasonMember < ApplicationRecord
    has_one :season
    has_one :team
end
