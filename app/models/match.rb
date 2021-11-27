# frozen_string_literal: true

class Match < ApplicationRecord
  belongs_to :fixture
  belongs_to :home_team, class_name: 'Team'
  belongs_to :away_team, class_name: 'Team'
end
