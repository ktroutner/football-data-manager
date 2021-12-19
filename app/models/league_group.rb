# frozen_string_literal: true

# == Schema Information
#
# Table name: league_groups
#
#  id         :integer          not null, primary key
#  name       :string
#  name_en    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  league_id  :integer          not null
#
# Indexes
#
#  index_league_groups_on_league_id  (league_id)
#
# Foreign Keys
#
#  league_id  (league_id => competition_stages.id)
#
class LeagueGroup < ApplicationRecord
  belongs_to :league, class_name: 'LeagueStage'
  has_many :group_teams, class_name: 'GroupTeam', foreign_key: :group_id, inverse_of: :group, dependent: :destroy
  has_many :competition_teams, through: :group_teams, source: :team
  has_many :teams, through: :competition_teams

  def name
    case I18n.locale
    when :en then self[:name_en]
    else self[:name]
    end
  end

  def standings(section = nil)
    group_teams.sort_by do |team|
      [team.points(section), team.goal_differential(section), team.goals_for(section)]
    end.reverse!
  end

  def winners(count = 1)
    standings.take(count)
  end

  def winner
    winners.first
  end
end
