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
class CompetitionSeries < ApplicationRecord
  has_many :iterations, class_name: 'Competition', foreign_key: :series_id, inverse_of: :series, dependent: :destroy

  enum region: Region::VALUES
  composed_of :region, class_name: 'Region', mapping: %w[region region]
  enum country: Country::VALUES
  composed_of :country, class_name: 'Country', mapping: %w[country country]

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
end
