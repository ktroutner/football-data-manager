# frozen_string_literal: true

# Controller for fixtures
class FixturesController < ApplicationController
  def show
    @fixture = Fixture.find(params[:id])
  end
end
