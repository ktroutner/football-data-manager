# frozen_string_literal: true

# == Schema Information
#
# Table name: fixtures
#
#  id            :integer          not null, primary key
#  name          :string
#  name_en       :string
#  name_short    :string
#  name_short_en :string
#  order         :integer          not null
#  type          :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  stage_id      :integer          not null
#
# Indexes
#
#  index_fixtures_on_stage_id            (stage_id)
#  index_fixtures_on_stage_id_and_order  (stage_id,order) UNIQUE
#
# Foreign Keys
#
#  stage_id  (stage_id => competition_stages.id)
#
require 'test_helper'

class FixtureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
