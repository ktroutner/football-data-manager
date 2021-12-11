# frozen_string_literal: true

# == Schema Information
#
# Table name: competition_stages
#
#  id             :integer          not null, primary key
#  name           :string           not null
#  name_en        :string           not null
#  type           :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  competition_id :integer          not null
#
# Indexes
#
#  index_competition_stages_on_competition_id  (competition_id)
#
# Foreign Keys
#
#  competition_id  (competition_id => competitions.id)
#
class CompetitionStage < ApplicationRecord
  belongs_to :competition
  has_many :fixtures, foreign_key: :stage_id, inverse_of: :stage, dependent: :destroy
  has_many :matches, foreign_key: :stage_id, inverse_of: :stage, dependent: :destroy

  def name
    case I18n.locale
    when :en then self[:name_en]
    else self[:name]
    end
  end
end
