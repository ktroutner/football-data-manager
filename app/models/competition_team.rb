# frozen_string_literal: true

# == Schema Information
#
# Table name: competition_teams
#
#  id             :integer          not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  competition_id :integer          not null
#  team_id        :integer          not null
#
# Indexes
#
#  index_competition_teams_on_competition_id  (competition_id)
#  index_competition_teams_on_team_id         (team_id)
#
# Foreign Keys
#
#  competition_id  (competition_id => competitions.id)
#  team_id         (team_id => teams.id)
#
class CompetitionTeam < ApplicationRecord
  belongs_to :competition
  belongs_to :team
end
