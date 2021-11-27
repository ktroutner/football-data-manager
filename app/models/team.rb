# frozen_string_literal: true

# == Schema Information
#
# Table name: teams
#
#  id             :integer          not null, primary key
#  hometown       :string
#  hometown_en    :string
#  name           :string           not null
#  name_en        :string           not null
#  name_short     :string           not null
#  name_short_en  :string           not null
#  prefecture     :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  main_league_id :integer
#
# Indexes
#
#  index_teams_on_main_league_id  (main_league_id)
#
# Foreign Keys
#
#  main_league_id  (main_league_id => competitions.id)
#
class Team < ApplicationRecord
  has_many :players, dependent: :nullify
  has_many :colors, class_name: 'TeamColor', dependent: :destroy
  has_many :home_matches, class_name: 'Match', foreign_key: 'home_team_id', inverse_of: :home_team, dependent: :nullify
  has_many :away_matches, class_name: 'Match', foreign_key: 'away_team_id', inverse_of: :away_team, dependent: :nullify
  has_many :memberships, class_name: 'SeasonMember', dependent: :destroy
  has_many :seasons, through: :memberships
  has_many :competitions, through: :seasons

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

  def hometown
    case I18n.locale
    when :en then read_attribute(:hometown_en)
    else read_attribute(:hometown)
    end
  end

  class << self
    def matches
      home_matches.merge(away_matches)
    end
  end
end
