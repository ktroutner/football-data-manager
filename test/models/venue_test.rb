# frozen_string_literal: true

# == Schema Information
#
# Table name: venues
#
#  id            :integer          not null, primary key
#  city          :string
#  city_en       :string
#  country       :integer          not null
#  name          :string           not null
#  name_en       :string           not null
#  name_short    :string           not null
#  name_short_en :string           not null
#  prefecture    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require 'test_helper'

class VenueTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
