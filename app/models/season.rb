class Season < ApplicationRecord
    belongs_to :competition
    has_many :members, class_name: "SeasonMember"
    has_many :teams, through: :members
    has_many :fixtures
end
