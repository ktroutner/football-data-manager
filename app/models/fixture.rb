# frozen_string_literal: true

# == Schema Information
#
# Table name: fixtures
#
#  id         :integer          not null, primary key
#  number     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  season_id  :integer
#
# Indexes
#
#  index_fixtures_on_season_id  (season_id)
#
class Fixture < ApplicationRecord
  belongs_to :season
  has_many :matches, dependent: :destroy

  def name
    "第#{number}節"
  end
end
