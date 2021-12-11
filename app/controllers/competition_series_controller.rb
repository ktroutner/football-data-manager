# frozen_string_literal: true

# Controller for competition series
class CompetitionSeriesController < ApplicationController
  # GET /competition_series
  def index
    @competition_series = CompetitionSeries.all
  end

  # GET /competitions_series/:id
  def show
    @competition_series = CompetitionSeries.find(params[:id])
  end
end
