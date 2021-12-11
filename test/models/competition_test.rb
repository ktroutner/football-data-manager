# frozen_string_literal: true

# == Schema Information
#
# Table name: competitions
#
#  id         :integer          not null, primary key
#  end_year   :integer          not null
#  start_year :integer          not null
#  type       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  series_id  :integer          not null
#
# Indexes
#
#  index_competitions_on_series_id  (series_id)
#
# Foreign Keys
#
#  series_id  (series_id => competition_series.id)
#
require 'test_helper'

class CompetitionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
