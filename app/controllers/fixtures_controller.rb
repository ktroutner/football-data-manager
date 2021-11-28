# frozen_string_literal: true

# Controller for fixtures
class FixturesController < ApplicationController
  # GET /fixtures/:id
  def show
    @fixture = Fixture.find(params[:id])
  end
end
