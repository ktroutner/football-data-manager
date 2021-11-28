# frozen_string_literal: true

# == Schema Information
#
# Table name: seasons
#
#  id             :integer          not null, primary key
#  year           :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  competition_id :integer
#
# Indexes
#
#  index_seasons_on_competition_id  (competition_id)
#
class Season < ApplicationRecord
  belongs_to :competition
  has_many :members, class_name: 'SeasonMember', dependent: :destroy
  has_many :teams, through: :members
  has_many :fixtures, dependent: :destroy

  def name
    competition_name = case I18n.locale
                       when :en then competition.name_en
                       else competition.name
                       end
    I18n.t('activerecord.attributes.season.name', competition: competition_name, year: year)
  end
end
