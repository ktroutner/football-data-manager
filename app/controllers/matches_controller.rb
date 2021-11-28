# frozen_string_literal: true

# Controller for matches
class MatchesController < ApplicationController
  def show
    @match = Match.find(params[:id])
  end
end
