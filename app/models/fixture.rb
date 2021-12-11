# frozen_string_literal: true

# == Schema Information
#
# Table name: fixtures
#
#  id             :integer          not null, primary key
#  name           :string
#  name_en        :string
#  name_short     :string
#  name_short_en  :string
#  order          :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  competition_id :integer          not null
#  stage_id       :integer
#
# Indexes
#
#  index_fixtures_on_competition_id                         (competition_id)
#  index_fixtures_on_competition_id_and_stage_id_and_order  (competition_id,stage_id,order) UNIQUE
#  index_fixtures_on_stage_id                               (stage_id)
#
# Foreign Keys
#
#  competition_id  (competition_id => competitions.id)
#  stage_id        (stage_id => competition_stages.id)
#
class Fixture < ApplicationRecord
  belongs_to :competition
  belongs_to :stage, class_name: 'CompetitionStage', optional: true
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
