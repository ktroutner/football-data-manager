# frozen_string_literal: true

# Controller for matches
class MatchesController < ApplicationController
  before_action :find_match, only: %i[show edit update]

  # GET /matches/:id
  def show
  end

  # GET /matches/:id/edit
  def edit
  end

  # PATCH /matches/:id/edit
  def update
    @match.update!(score_params)
    redirect_to @match
  end

  private

  def find_match
    @match = Match.find(params[:id])
  end

  def score_params
    params.require(:match).permit(:home_score, :away_score)
  end
end
