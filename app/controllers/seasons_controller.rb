# frozen_string_literal: true

# Controller for seasons
class SeasonsController < ApplicationController
  # GET /seasons/:id
  def show
    @season = Season.find(params[:id])
  end
end
