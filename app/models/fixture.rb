# frozen_string_literal: true

# == Schema Information
#
# Table name: fixtures
#
#  id            :integer          not null, primary key
#  name          :string
#  name_en       :string
#  name_short    :string
#  name_short_en :string
#  order         :integer          not null
#  type          :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  stage_id      :integer          not null
#
# Indexes
#
#  index_fixtures_on_stage_id            (stage_id)
#  index_fixtures_on_stage_id_and_order  (stage_id,order) UNIQUE
#
# Foreign Keys
#
#  stage_id  (stage_id => competition_stages.id)
#
class Fixture < ApplicationRecord
  belongs_to :stage, class_name: 'CompetitionStage', optional: true
  has_one :competition, through: :stage
  has_one :competition_series, through: :competition, source: :series
  has_many :matches, dependent: :destroy

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
