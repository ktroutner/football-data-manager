# frozen_string_literal: true

j1 = CompetitionSeries.create!(
  name: '明治安田生命J1リーグ',
  name_en: 'Meiji Yasuda Seimei J1 League',
  name_short: 'J1',
  name_short_en: 'J1',
  region: Region.new(:asia),
  country: Country.new(:japan)
)
j1.iterations.create!(type: 'League', start_year: 2021, end_year: 2021)
