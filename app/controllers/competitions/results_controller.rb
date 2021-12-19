# frozen_string_literal: true

module Competitions
  # Controller for results of given competition
  class ResultsController < BaseController
    # GET /competitions/:id/results
    def index
      @winner = @competition.winner
    end
  end
end
