# frozen_string_literal: true

# Controller for matches
class MatchesController < ApplicationController
  # GET /matches/:id
  def show
    @match = Match.find(params[:id])
  end
end
