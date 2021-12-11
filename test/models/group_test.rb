# frozen_string_literal: true

# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string
#  name_en    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  stage_id   :integer          not null
#
# Indexes
#
#  index_groups_on_stage_id  (stage_id)
#
# Foreign Keys
#
#  stage_id  (stage_id => competition_stages.id)
#
require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
