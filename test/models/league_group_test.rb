# frozen_string_literal: true

# == Schema Information
#
# Table name: league_groups
#
#  id         :integer          not null, primary key
#  name       :string
#  name_en    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  league_id  :integer          not null
#
# Indexes
#
#  index_league_groups_on_league_id  (league_id)
#
# Foreign Keys
#
#  league_id  (league_id => competition_stages.id)
#
require 'test_helper'

class LeagueGroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
