# frozen_string_literal: true

module Competitions
  # Controller for statistics of a given competition
  class StatisticsController < BaseController
    # GET /competitions/:id/statistics
    def index
      competition_statistics

      first_stage = @competition.stages.first
      return unless first_stage.is_a?(LeagueStage) && first_stage.groups.count == 1

      league_statistics(first_stage)
    end

    private

    def competition_statistics
      @goals_for = @competition.goals_for_ranking
      @goals_against = @competition.goals_against_ranking
      @goal_differential = @competition.goal_differential_ranking
    end

    def league_statistics(league)
      @goals_for_transitions = league.goals_for_transitions[league.groups.first]
      @goals_against_transitions = league.goals_against_transitions[league.groups.first]
      @goal_differential_transitions = league.goal_differential_transitions[league.groups.first]
    end
  end
end
