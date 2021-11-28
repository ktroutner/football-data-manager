# frozen_string_literal: true

# == Schema Information
#
# Table name: stadiums
#
#  id            :integer          not null, primary key
#  name          :string           not null
#  name_en       :string           not null
#  name_short    :string           not null
#  name_short_en :string           not null
#  prefecture    :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Stadium < ApplicationRecord
  has_many :matches, dependent: :nullify
end
