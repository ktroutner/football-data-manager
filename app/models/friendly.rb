# frozen_string_literal: true

# == Schema Information
#
# Table name: competitions
#
#  id         :integer          not null, primary key
#  end_year   :integer          not null
#  start_year :integer          not null
#  type       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  series_id  :integer          not null
#
# Indexes
#
#  index_competitions_on_series_id  (series_id)
#
# Foreign Keys
#
#  series_id  (series_id => competition_series.id)
#
class Friendly < Competition
  def name
    I18n.t('activerecord.attributes.friendly.name', series_name: series.name, year: display_year)
  end
end
