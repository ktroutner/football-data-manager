# frozen_string_literal: true

# == Schema Information
#
# Table name: team_colors
#
#  id         :integer          not null, primary key
#  code       :string           not null
#  name       :string
#  name_en    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  team_id    :integer
#
# Indexes
#
#  index_team_colors_on_team_id  (team_id)
#
class TeamColor < ApplicationRecord
  belongs_to :team
end
