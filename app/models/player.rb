# frozen_string_literal: true

# == Schema Information
#
# Table name: players
#
#  id            :integer          not null, primary key
#  country       :integer          not null
#  date_of_birth :date
#  footedness    :integer
#  height        :integer
#  name          :string           not null
#  name_en       :string           not null
#  name_kana     :string           not null
#  position      :integer          not null
#  prefecture    :integer          not null
#  status        :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Player < ApplicationRecord
  has_many :team_players, dependent: :destroy
  has_many :teams, through: :team_players
  has_many :former_team_players, -> { TeamPlayer.former },
           class_name: 'TeamPlayer', foreign_key: :player_id, inverse_of: :player, dependent: :destroy
  has_many :former_teams, class_name: 'Team', through: :former_team_players, source: :team
  has_one :current_team_player, -> { TeamPlayer.current },
          class_name: 'TeamPlayer', foreign_key: :player_id, inverse_of: :player, dependent: :destroy
  has_one :current_team, class_name: 'Team', through: :current_team_player, source: :team

  enum country: Country::VALUES
  composed_of :country, mapping: %w[country country]
  enum prefecture: Prefecture::VALUES
  composed_of :prefecture, mapping: %w[prefecture prefecture]
  enum position: PlayerPosition::VALUES
  composed_of :position, class_name: 'PlayerPosition', mapping: %w[position position]
  enum footedness: { right: 1, left: 2, both: 3 }
  enum status: { active: 1, retired: 2 }, _prefix: true

  def name
    case I18n.locale
    when :en then self[:name_en]
    else self[:name]
    end
  end
end
