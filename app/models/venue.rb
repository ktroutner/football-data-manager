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
class Venue < ApplicationRecord
  has_many :matches, dependent: :nullify

  enum country: Country::VALUES
  composed_of :country, mapping: %w[country country]
  enum prefecture: Prefecture::VALUES
  composed_of :prefecture, mapping: %w[prefecture prefecture]

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

  def city
    case I18n.locale
    when :en then self[:city_en]
    else self[:city]
    end
  end
end
