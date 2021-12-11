# frozen_string_literal: true

# == Schema Information
#
# Table name: clubs
#
#  id             :integer          not null, primary key
#  country        :integer
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
class Club < ApplicationRecord
  has_many :teams, dependent: :destroy
  has_many :colors, class_name: 'ClubColor', dependent: :destroy

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

  def hometown
    case I18n.locale
    when :en then self[:hometown_en]
    else self[:hometown]
    end
  end
end
