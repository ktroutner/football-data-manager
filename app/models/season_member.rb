# frozen_string_literal: true

class SeasonMember < ApplicationRecord
  belongs_to :season
  belongs_to :team
end
