# frozen_string_literal: true

# == Schema Information
#
# Table name: teams
#
#  id             :integer          not null, primary key
#  end_year       :integer
#  start_year     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  club_id        :integer          not null
#  main_league_id :integer
#
# Indexes
#
#  index_teams_on_club_id         (club_id)
#  index_teams_on_main_league_id  (main_league_id)
#
# Foreign Keys
#
#  club_id         (club_id => clubs.id)
#  main_league_id  (main_league_id => competitions.id)
#
class Team < ApplicationRecord
  belongs_to :club
  belongs_to :main_league, class_name: 'League', optional: true
  has_many :competition_teams, dependent: :destroy
  has_many :competitions, through: :competition_teams
  has_many :home_matches, class_name: 'Match', dependent: :nullify
  has_many :away_matches, class_name: 'Match', dependent: :nullify

  delegate :name, :short_name, to: :club

  def display_year
    return start_year.to_s if start_year == end_year

    "#{start_year} - #{end_year}"
  end
end
