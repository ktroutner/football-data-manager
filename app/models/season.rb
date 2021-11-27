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
  has_many :members, class_name: 'SeasonMember'
  has_many :teams, through: :members
  has_many :fixtures
end
