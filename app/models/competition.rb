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
class Competition < ApplicationRecord
  belongs_to :series, class_name: 'CompetitionSeries'
  has_many :competition_teams, dependent: :destroy
  has_many :teams, through: :competition_teams
  has_many :matches, dependent: :destroy

  def display_year
    return start_year.to_s if start_year == end_year

    "#{start_year} - #{end_year}"
  end

  def name
    raise NotImplementedError
  end
end
