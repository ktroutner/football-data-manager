# frozen_string_literal: true

# Match statistics for team
module TeamStatistics
  extend ActiveSupport::Concern

  # should be implemented by model including this module
  def home_matches
    raise NotImplementedError
  end

  # should be implemented by model including this module
  def away_matches
    raise NotImplementedError
  end

  def matches(section = nil)
    home_matches(section) + away_matches(section)
  end

  def home_wins(section = nil)
    home_matches(section).where('home_score > away_score')
  end

  def home_losses(section = nil)
    home_matches(section).where('home_score < away_score')
  end

  def home_draws(section = nil)
    home_matches(section).where('home_score = away_score')
  end

  def away_wins(section = nil)
    away_matches(section).where('away_score > home_score')
  end

  def away_losses(section = nil)
    away_matches(section).where('away_score < home_score')
  end

  def away_draws(section = nil)
    away_matches(section).where('away_score = home_score')
  end

  def wins(section = nil)
    home_wins(section) + away_wins(section)
  end

  def losses(section = nil)
    home_losses(section) + away_losses(section)
  end

  def draws(section = nil)
    home_draws(section) + away_draws(section)
  end

  def home_goals_for(section = nil)
    home_matches(section).pluck(:home_score).compact.sum
  end

  def home_goals_against(section = nil)
    home_matches(section).pluck(:away_score).compact.sum
  end

  def away_goals_for(section = nil)
    away_matches(section).pluck(:away_score).compact.sum
  end

  def away_goals_against(section = nil)
    away_matches(section).pluck(:home_score).compact.sum
  end

  def points(section = nil)
    (wins(section).count * 3) + draws(section).count
  end

  def goals_for(section = nil)
    home_goals_for(section) + away_goals_for(section)
  end

  def goals_against(section = nil)
    home_goals_against(section) + away_goals_against(section)
  end

  def goal_differential(section = nil)
    goals_for(section) - goals_against(section)
  end
end
