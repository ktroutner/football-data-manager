# frozen_string_literal: true

# == Schema Information
#
# Table name: staffs
#
#  id            :integer          not null, primary key
#  country       :integer          not null
#  date_of_birth :date
#  name          :string           not null
#  name_en       :string           not null
#  name_kana     :string
#  prefecture    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  player_id     :integer
#
# Indexes
#
#  index_staffs_on_player_id  (player_id)
#
# Foreign Keys
#
#  player_id  (player_id => players.id)
#
class Staff < ApplicationRecord
  has_many :team_staffs, dependent: :destroy
  has_many :teams, through: :team_staffs
  has_many :former_team_staffs, -> { TeamStaff.former },
           class_name: 'TeamStaff', foreign_key: :staff_id, inverse_of: :staff, dependent: :destroy
  has_many :former_teams, class_name: 'Team', through: :former_team_staffs, source: :team
  has_one :current_team_staff, -> { TeamStaff.current },
          class_name: 'TeamStaff', foreign_key: :staff_id, inverse_of: :staff, dependent: :destroy
  has_one :current_team, class_name: 'Team', through: :current_team_staff, source: :team
  belongs_to :player, optional: true

  enum country: Country::VALUES
  composed_of :country, mapping: %w[country country]
  enum prefecture: Prefecture::VALUES
  composed_of :prefecture, mapping: %w[prefecture prefecture]

  def name
    case I18n.locale
    when :en then self[:name_en]
    else self[:name]
    end
  end
end
