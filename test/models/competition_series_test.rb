# frozen_string_literal: true

# == Schema Information
#
# Table name: competition_series
#
#  id            :integer          not null, primary key
#  country       :integer
#  international :boolean          default(FALSE), not null
#  name          :string           not null
#  name_en       :string           not null
#  name_short    :string           not null
#  name_short_en :string           not null
#  region        :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require 'test_helper'

class CompetitionSeriesTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
