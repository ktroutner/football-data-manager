# frozen_string_literal: true

# == Schema Information
#
# Table name: competition_stages
#
#  id             :integer          not null, primary key
#  name           :string
#  name_en        :string
#  order          :integer          not null
#  type           :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  competition_id :integer          not null
#
# Indexes
#
#  index_competition_stages_on_competition_id            (competition_id)
#  index_competition_stages_on_competition_id_and_order  (competition_id,order) UNIQUE
#
# Foreign Keys
#
#  competition_id  (competition_id => competitions.id)
#
class LeagueStage < CompetitionStage
  has_many :matchdays, class_name: 'Matchday', foreign_key: :stage_id, inverse_of: :stage, dependent: :destroy
  has_many :matches, through: :matchdays
  has_many :groups, class_name: 'LeagueGroup', foreign_key: :league_id, inverse_of: :league, dependent: :destroy

  def standings(section = nil)
    groups.index_with { |group| group.standings(section) }
  end

  def winners(count = 1)
    groups.index_with { |group| group.winners(count) }
  end

  def winner
    raise StandardError unless groups.count == 1

    winners.values.flatten.first
  end

  def goals_for_transitions
    statistics_hash(:goals_for)
  end

  def goals_against_transitions
    statistics_hash(:goals_against)
  end

  def goal_differential_transitions
    statistics_hash(:goal_differential)
  end

  def points_transitions
    statistics_hash(:points)
  end

  private

  def statistics_hash(method)
    groups.index_with do |group|
      group.group_teams.map do |team|
        {
          team: {
            name: team.name,
            color: team.primary_color.code
          },
          data: matchdays.map do |matchday|
            { x: matchday.order, y: team.send(method, matchday.order) }
          end
        }
      end
    end
  end
end
