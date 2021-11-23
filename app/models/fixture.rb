class Fixture < ApplicationRecord
    belongs_to :season
    has_many :matches
end
