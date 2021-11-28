# frozen_string_literal: true

# Controller for seasons
class SeasonsController < ApplicationController
  def show
    @season = Season.find(params[:id])
  end
end
