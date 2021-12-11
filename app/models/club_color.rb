# frozen_string_literal: true

# == Schema Information
#
# Table name: club_colors
#
#  id         :integer          not null, primary key
#  code       :string           not null
#  name       :string
#  name_en    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  club_id    :integer          not null
#
# Indexes
#
#  index_club_colors_on_club_id  (club_id)
#
# Foreign Keys
#
#  club_id  (club_id => clubs.id)
#
class ClubColor < ApplicationRecord
  belongs_to :club
end
