# frozen_string_literal: true

# == Schema Information
#
# Table name: season_members
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  season_id  :integer
#  team_id    :integer
#
# Indexes
#
#  index_season_members_on_season_id  (season_id)
#  index_season_members_on_team_id    (team_id)
#
class SeasonMember < ApplicationRecord
  belongs_to :season
  belongs_to :team
end
