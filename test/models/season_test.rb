# frozen_string_literal: true

# == Schema Information
#
# Table name: seasons
#
#  id             :integer          not null, primary key
#  year           :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  competition_id :integer
#
# Indexes
#
#  index_seasons_on_competition_id  (competition_id)
#
require 'test_helper'

class SeasonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
