# frozen_string_literal: true

j1 = CompetitionSeries.create!(
  name: '明治安田生命J1リーグ',
  name_en: 'Meiji Yasuda Seimei J1 League',
  name_short: 'J1',
  name_short_en: 'J1',
  region: Region.new(:asia),
  country: Country.new(:japan)
)
j1_2021 = j1.iterations.create!(
  start_year: 2021,
  name: '2021 明治安田生命J1リーグ',
  name_en: '2021 Meiji Yasuda Seimei J1 League',
  name_short: 'J1 2021',
  name_short_en: 'J1 2021'
)
league = j1_2021.stages.create!(
  type: 'LeagueStage',
  order: 1
)
league.groups.create!
