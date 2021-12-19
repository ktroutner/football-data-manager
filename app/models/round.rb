# frozen_string_literal: true

# == Schema Information
#
# Table name: fixtures
#
#  id            :integer          not null, primary key
#  name          :string
#  name_en       :string
#  name_short    :string
#  name_short_en :string
#  order         :integer          not null
#  type          :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  stage_id      :integer          not null
#
# Indexes
#
#  index_fixtures_on_stage_id            (stage_id)
#  index_fixtures_on_stage_id_and_order  (stage_id,order) UNIQUE
#
# Foreign Keys
#
#  stage_id  (stage_id => competition_stages.id)
#
class Round < Fixture
  def winners
    matchups = matches.group_by { |match| [match.home_team, match.away_team].sort }
    matchups.map { |_matchup, matches| matchup_winner(matches) }
  end

  def winner
    raise StandardError unless matches.count == 1

    matches.first.winner
  end

  def losers
    matches.map(&:loser)
  end

  def loser
    raise StandardError unless matches.count == 1

    matches.first.loser
  end

  private

  def matchup_winner(matches)
    case matches.size
    when 1 then matches.first.winner
    when 2 then aggregate_winner(matches)
    else raise InvalidArgumentError
    end
  end

  def aggregate_winner(matches)
    team1 = matches.first.home_team
    team2 = matches.first.away_team

    winner_by_aggregate_goals(team1, team2, matches) ||
      winner_by_away_goals(team1, team2, matches) ||
      matches.second.winner_by_pk
  end

  def winner_by_aggregate_goals(team1, team2, matches)
    team1_aggregate = matches.first.home_score + matches.second.away_score
    team2_aggregate = matches.first.away_score + matches.second.home_score

    if team1_aggregate > team2_aggregate then team1
    elsif team2_aggregate > team1_aggregate then team2
    end
  end

  def winner_by_away_goals(team1, team2, matches)
    team1_away_goals = matches.second.away_score
    team2_away_goals = matches.first.away_score

    if team1_away_goals > team2_away_goals then team1
    elsif team2_away_goals > team1_away_goals then team2
    end
  end
end
