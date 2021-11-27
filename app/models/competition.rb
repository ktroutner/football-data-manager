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

  def name
    case I18n.locale
    when :en then read_attribute(:name_en)
    else read_attribute(:name)
    end
  end

  def short_name
    case I18n.locale
    when :en then read_attribute(:name_short_en)
    else read_attribute(:name_short)
    end
  end
end
