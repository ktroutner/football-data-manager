# frozen_string_literal: true

# == Schema Information
#
# Table name: competitions
#
#  id            :integer          not null, primary key
#  end_year      :integer
#  name          :string           not null
#  name_en       :string           not null
#  name_short    :string           not null
#  name_short_en :string           not null
#  start_year    :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  series_id     :integer          not null
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
