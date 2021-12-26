# frozen_string_literal: true

module Competitions
  # Controller for results of given competition
  class ResultsController < BaseController
    # GET /competitions/:id/results
    def index
      @winner = @competition.winner

      first_stage = @competition.stages.first
      return unless first_stage.is_a?(LeagueStage)

      @points_transitions = first_stage.points_transitions
    end
  end
end
