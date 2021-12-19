# frozen_string_literal: true

# == Schema Information
#
# Table name: competition_stages
#
#  id             :integer          not null, primary key
#  name           :string
#  name_en        :string
#  order          :integer          not null
#  type           :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  competition_id :integer          not null
#
# Indexes
#
#  index_competition_stages_on_competition_id            (competition_id)
#  index_competition_stages_on_competition_id_and_order  (competition_id,order) UNIQUE
#
# Foreign Keys
#
#  competition_id  (competition_id => competitions.id)
#
class KnockoutStage < CompetitionStage
  has_many :rounds, class_name: 'Round', foreign_key: :stage_id, inverse_of: :stage, dependent: :destroy
  has_many :matches, through: :rounds

  def winners
    rounds.order(:order).last.winners
  end

  def winner
    rounds.order(:order).last.winner
  end
end
