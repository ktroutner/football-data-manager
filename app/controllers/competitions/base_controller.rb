# frozen_string_literal: true

module Competitions
  # Base controller for competition related controllers
  class BaseController < ApplicationController
    before_action :find_competition

    private

    def find_competition
      @competition = Competition.find(params[:id])
    end
  end
end
