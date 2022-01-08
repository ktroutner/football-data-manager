# frozen_string_literal: true

# == Schema Information
#
# Table name: players
#
#  id            :integer          not null, primary key
#  country       :integer          not null
#  date_of_birth :date
#  footedness    :integer
#  height        :integer
#  name          :string           not null
#  name_en       :string           not null
#  name_kana     :string
#  position      :integer          not null
#  prefecture    :integer
#  status        :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
