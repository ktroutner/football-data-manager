# frozen_string_literal: true

# == Schema Information
#
# Table name: clubs
#
#  id             :integer          not null, primary key
#  country        :integer          not null
#  hometown       :string
#  hometown_en    :string
#  logo_file_path :string
#  name           :string           not null
#  name_en        :string           not null
#  name_short     :string           not null
#  name_short_en  :string           not null
#  prefecture     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require 'test_helper'

class ClubTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
