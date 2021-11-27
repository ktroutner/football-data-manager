# frozen_string_literal: true

# == Schema Information
#
# Table name: competitions
#
#  id            :integer          not null, primary key
#  country       :integer
#  name          :string           not null
#  name_en       :string           not null
#  name_short    :string           not null
#  name_short_en :string           not null
#  region        :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Competition < ApplicationRecord
  has_many :seasons, dependent: :destroy
end
