# frozen_string_literal: true

# == Schema Information
#
# Table name: fixtures
#
#  id         :integer          not null, primary key
#  number     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  season_id  :integer
#
# Indexes
#
#  index_fixtures_on_season_id  (season_id)
#
require 'test_helper'

class FixtureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
