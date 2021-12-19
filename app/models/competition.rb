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
class Competition < ApplicationRecord
  belongs_to :series, class_name: 'CompetitionSeries'
  has_many :competition_teams, dependent: :destroy
  has_many :teams, through: :competition_teams
  has_many :stages, class_name: 'CompetitionStage', dependent: :destroy
  has_many :fixtures, through: :stages
  has_many :matches, through: :fixtures

  def name
    case I18n.locale
    when :en then self[:name_en]
    else self[:name]
    end
  end

  def short_name
    case I18n.locale
    when :en then self[:name_short_en]
    else self[:name_short]
    end
  end

  def display_year
    return start_year.to_s if end_year.nil? || end_year == start_year

    "#{start_year} - #{end_year}"
  end
end
