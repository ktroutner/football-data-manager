# frozen_string_literal: true

# == Schema Information
#
# Table name: teams
#
#  id             :integer          not null, primary key
#  end_year       :integer
#  start_year     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  club_id        :integer          not null
#  main_league_id :integer
#
# Indexes
#
#  index_teams_on_club_id         (club_id)
#  index_teams_on_main_league_id  (main_league_id)
#
# Foreign Keys
#
#  club_id         (club_id => clubs.id)
#  main_league_id  (main_league_id => competitions.id)
#
require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
