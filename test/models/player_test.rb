# frozen_string_literal: true

# == Schema Information
#
# Table name: players
#
#  id         :integer          not null, primary key
#  birthday   :date
#  country    :integer
#  footedness :integer
#  height     :integer
#  name       :string           not null
#  name_en    :string           not null
#  name_kana  :string           not null
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  team_id    :integer
#
# Indexes
#
#  index_players_on_team_id  (team_id)
#
require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
