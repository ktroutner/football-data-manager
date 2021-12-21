# frozen_string_literal: true

module Competitions
  # Controller for statistics of a given competition
  class StatisticsController < BaseController
    # GET /competitions/:id/statistics
    def index
      @goals_for = @competition.competition_teams.index_with(&:goals_for).sort_by { |_, goals| -goals }
      @goals_against = @competition.competition_teams.index_with(&:goals_against).sort_by { |_, goals| goals }
      @goal_differential = @competition.competition_teams.index_with(&:goal_differential).sort_by { |_, goals| -goals }
    end
  end
end
