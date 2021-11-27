# frozen_string_literal: true

# == Schema Information
#
# Table name: teams
#
#  id             :integer          not null, primary key
#  hometown       :string
#  hometown_en    :string
#  name           :string           not null
#  name_en        :string           not null
#  name_short     :string           not null
#  name_short_en  :string           not null
#  prefecture     :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  main_league_id :integer
#
# Indexes
#
#  index_teams_on_main_league_id  (main_league_id)
#
# Foreign Keys
#
#  main_league_id  (main_league_id => competitions.id)
#
require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
