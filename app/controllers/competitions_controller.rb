# frozen_string_literal: true

# Controller for competitions
class CompetitionsController < ApplicationController
  # GET /competitions/:id
  def show
    @competition = Competition.find(params[:id])
  end
end
