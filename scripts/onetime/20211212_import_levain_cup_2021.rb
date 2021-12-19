# frozen_string_literal: true

require 'csv'

ybc = CompetitionSeries.find_or_create_by!(
  name: 'JリーグYBCルヴァンカップ',
  name_en: 'J-League YBC Levain Cup',
  name_short: 'ルヴァンカップ',
  name_short_en: 'Levain Cup',
  region: Region.new(:asia),
  country: Country.new(:japan)
)
ybc_2021 = ybc.iterations.find_or_create_by!(
  start_year: 2021,
  name: '2021 JリーグYBCルヴァンカップ',
  name_en: '2021 J-League YBC Levain Cup',
  name_short: '2021 ルヴァンカップ',
  name_short_en: '2021 Levain Cup'
)

group_a_team_names = %w[鹿島 札幌 福岡 鳥栖]
group_a_teams = Team.joins(:club)
                    .where(start_year: 2021)
                    .where(club: { name_short: group_a_team_names })

group_b_team_names = %w[FC東京 神戸 大分 徳島]
group_b_teams = Team.joins(:club)
                    .where(start_year: 2021)
                    .where(club: { name_short: group_b_team_names })

group_c_team_names = %w[浦和 湘南 横浜FC 柏]
group_c_teams = Team.joins(:club)
                    .where(start_year: 2021)
                    .where(club: { name_short: group_c_team_names })

group_d_team_names = %w[横浜FM 清水 仙台 広島]
group_d_teams = Team.joins(:club)
                    .where(start_year: 2021)
                    .where(club: { name_short: group_d_team_names })

prime_stage_team_names = %w[名古屋 C大阪 G大阪 川崎F]
prime_stage_teams = Team.joins(:club)
                        .where(start_year: 2021)
                        .where(club: { name_short: prime_stage_team_names })

competing_teams = group_a_teams + group_b_teams + group_c_teams + group_d_teams + prime_stage_teams
competing_teams.each do |team|
  CompetitionTeam.find_or_create_by!(competition: ybc_2021, team: team)
end

group_stage = ybc_2021.stages.find_or_create_by!(
  type: 'LeagueStage',
  order: 1,
  name: 'グループステージ',
  name_en: 'Group Stage'
)
(1..6).each do |i|
  group_stage.matchdays.find_or_create_by!(
    order: i,
    name: "第#{i}節",
    name_en: "Matchday #{i}",
    name_short: "第#{i}節",
    name_short_en: "MD#{i}"
  )
end

group_a = group_stage.groups.find_or_create_by!(name: 'Aグループ', name_en: 'A Group')
group_a_teams.each do |team|
  competition_team = ybc_2021.competition_teams.find_by(team: team)
  group_a.group_teams.find_or_create_by!(team: competition_team)
end
group_b = group_stage.groups.find_or_create_by!(name: 'Bグループ', name_en: 'B Group')
group_b_teams.each do |team|
  competition_team = ybc_2021.competition_teams.find_by(team: team)
  group_b.group_teams.find_or_create_by!(team: competition_team)
end
group_c = group_stage.groups.find_or_create_by!(name: 'Cグループ', name_en: 'C Group')
group_c_teams.each do |team|
  competition_team = ybc_2021.competition_teams.find_by(team: team)
  group_c.group_teams.find_or_create_by!(team: competition_team)
end
group_d = group_stage.groups.find_or_create_by!(name: 'Dグループ', name_en: 'D Group')
group_d_teams.each do |team|
  competition_team = ybc_2021.competition_teams.find_by(team: team)
  group_d.group_teams.find_or_create_by!(team: competition_team)
end

playoff_stage = ybc_2021.stages.find_or_create_by!(
  type: 'KnockoutStage',
  order: 2,
  name: 'プレーオフステージ',
  name_en: 'Playoff Stage'
)
playoff_stage.rounds.find_or_create_by!(
  order: 1,
  name: 'プレーオフ',
  name_en: 'Playoff',
  name_short: 'プレーオフ',
  name_short_en: 'Playoff'
)

prime_stage = ybc_2021.stages.find_or_create_by!(
  type: 'KnockoutStage',
  order: 3,
  name: 'プライムステージ',
  name_en: 'Prime Stage'
)
prime_stage.rounds.find_or_create_by!(
  order: 1,
  name: '準々決勝',
  name_en: 'Quarterfinals',
  name_short: '準々決勝',
  name_short_en: 'Quarterfinals'
)
prime_stage.rounds.find_or_create_by!(
  order: 2,
  name: '準決勝',
  name_en: 'Semifinals',
  name_short: '準決勝',
  name_short_en: 'Semifinals'
)
prime_stage.rounds.find_or_create_by!(
  order: 3,
  name: '決勝',
  name_en: 'Final',
  name_short: '決勝',
  name_short_en: 'Final'
)

# Fixture,Date,Kickoff time,Location,Home team,Away team,Score(home),Score(away)
group_stage_data = <<~CSV_TEXT
  1,2021/03/02,18:00,レモンS,湘南,浦和,0,0
  1,2021/03/02,19:00,昭和電ド,大分,神戸,1,3
  1,2021/03/03,18:00,ベススタ,福岡,札幌,2,3
  1,2021/03/03,18:00,味スタ,FC東京,徳島,1,0
  1,2021/03/03,18:00,三協F柏,柏,横浜FC,0,1
  1,2021/03/03,18:00,ニッパツ,横浜FM,仙台,1,0
  1,2021/03/03,19:00,カシマ,鹿島,鳥栖,3,0
  1,2021/03/03,19:00,Eスタ,広島,清水,0,0
  2,2021/03/27,14:00,駅スタ,鳥栖,札幌,1,5
  2,2021/03/27,14:00,鳴門大塚,徳島,大分,0,1
  2,2021/03/27,14:00,ユアスタ,仙台,清水,0,1
  2,2021/03/27,14:00,ニッパツ,横浜FM,広島,5,0
  2,2021/03/27,15:00,埼玉,浦和,柏,0,1
  2,2021/03/27,15:00,レモンS,湘南,横浜FC,1,0
  2,2021/03/27,18:00,ベススタ,福岡,鹿島,1,5
  2,2021/03/28,14:00,味スタ,FC東京,神戸,2,0
  3,2021/04/20,19:00,カシマ,鹿島,札幌,3,0
  3,2021/04/21,18:00,ノエスタ,神戸,徳島,0,1
  3,2021/04/21,18:00,三協F柏,柏,湘南,1,1
  3,2021/04/21,19:00,昭和電ド,大分,FC東京,0,1
  3,2021/04/21,19:00,ニッパツ,横浜FC,浦和,1,2
  3,2021/04/21,19:00,アイスタ,清水,横浜FM,0,0
  3,2021/04/21,19:00,Eスタ,広島,仙台,0,1
  3,2021/04/21,19:00,駅スタ,鳥栖,福岡,0,1
  4,2021/04/28,18:00,ノエスタ,神戸,大分,0,0
  4,2021/04/28,18:00,埼玉,浦和,湘南,0,0
  4,2021/04/28,18:00,ユアスタ,仙台,横浜FM,2,5
  4,2021/04/28,19:00,鳴門大塚,徳島,FC東京,1,1
  4,2021/04/28,19:00,ニッパツ,横浜FC,柏,2,0
  4,2021/04/28,19:00,アイスタ,清水,広島,1,2
  4,2021/04/28,19:00,札幌ド,札幌,福岡,1,1
  4,2021/04/28,19:00,駅スタ,鳥栖,鹿島,2,2
  5,2021/05/05,14:00,札幌ド,札幌,鳥栖,2,1
  5,2021/05/05,14:00,昭和電ド,大分,徳島,1,1
  5,2021/05/05,14:00,ニッパツ,横浜FC,湘南,1,1
  5,2021/05/05,14:00,アイスタ,清水,仙台,4,1
  5,2021/05/05,14:00,Eスタ,広島,横浜FM,1,1
  5,2021/05/05,15:00,カシマ,鹿島,福岡,1,1
  5,2021/05/05,15:00,ノエスタ,神戸,FC東京,0,0
  5,2021/05/05,16:00,三協F柏,柏,浦和,3,3
  6,2021/05/19,19:00,札幌ド,札幌,鹿島,0,0
  6,2021/05/19,19:00,ベススタ,福岡,鳥栖,4,1
  6,2021/05/19,19:00,味スタ,FC東京,大分,1,1
  6,2021/05/19,19:00,鳴門大塚,徳島,神戸,0,3
  6,2021/05/19,19:00,埼玉,浦和,横浜FC,2,0
  6,2021/05/19,19:00,レモンS,湘南,柏,1,1
  6,2021/05/19,19:00,ユアスタ,仙台,広島,3,0
  6,2021/05/19,19:00,ニッパツ,横浜FM,清水,5,1
CSV_TEXT

CSV.parse(group_stage_data) do |row|
  matchday = Matchday.find_by(stage: group_stage, order: row[0])
  matchday.matches.find_or_create_by!(
    category: 0,
    home_team: Team.find_by(club: Club.find_by(name_short: row[4]), start_year: 2021),
    away_team: Team.find_by(club: Club.find_by(name_short: row[5]), start_year: 2021),
    venue: Venue.find_by(name_short: row[3]),
    kickoff_at: Time.zone.parse("#{row[1]} #{row[2]}"),
    status: :complete,
    home_score: row[6],
    away_score: row[7]
  )
end

# Round,Date,Kickoff time,Location,Home team,Away team,Score(home),Score(away)
playoff_stage_data = <<~CSV_TEXT
  1,2021/06/02,19:00,アイスタ,清水,鹿島,0,1
  1,2021/06/05,14:00,駒沢,FC東京,湘南,0,1
  1,2021/06/06,13:00,札幌厚別,札幌,横浜FM,1,1
  1,2021/06/06,15:00,カシマ,鹿島,清水,2,1
  1,2021/06/06,18:00,ノエスタ,神戸,浦和,1,2
  1,2021/06/13,17:00,ニッパツ,横浜FM,札幌,1,3
  1,2021/06/13,17:00,レモンS,湘南,FC東京,1,4
  1,2021/06/13,18:00,浦和駒場,浦和,神戸,2,2
CSV_TEXT

Venue.find_or_create_by!(
  name: '駒沢オリンピック公園総合運動場陸上競技場',
  name_en: 'Komazawa Olumpic Park General Sports Ground',
  name_short: '駒沢',
  name_short_en: 'Komazawa',
  country: Country.new(:japan),
  prefecture: Prefecture.new(:tokyo),
  city: '世田谷区',
  city_en: 'Setagaya'
)

CSV.parse(playoff_stage_data) do |row|
  round = Round.find_by(stage: playoff_stage, order: row[0])
  round.matches.find_or_create_by!(
    category: 0,
    home_team: Team.find_by(club: Club.find_by(name_short: row[4]), start_year: 2021),
    away_team: Team.find_by(club: Club.find_by(name_short: row[5]), start_year: 2021),
    venue: Venue.find_by(name_short: row[3]),
    kickoff_at: Time.zone.parse("#{row[1]} #{row[2]}"),
    status: :complete,
    home_score: row[6],
    away_score: row[7]
  )
end

# Round,Date,Kickoff time,Location,Home team,Away team,Score(home),Score(away)
prime_stage_data = <<~CSV_TEXT
  準々決勝,2021/09/01,19:00,札幌厚別,札幌,FC東京,2,1
  準々決勝,2021/09/01,19:00,豊田ス,名古屋,鹿島,2,0
  準々決勝,2021/09/01,19:00,ヨドコウ,C大阪,G大阪,0,1
  準々決勝,2021/09/01,19:00,浦和駒場,浦和,川崎F,1,1
  準々決勝,2021/09/05,18:00,レモンS,FC東京,札幌,2,0
  準々決勝,2021/09/05,18:00,カシマ,鹿島,名古屋,0,2
  準々決勝,2021/09/05,18:00,パナスタ,G大阪,C大阪,0,4
  準々決勝,2021/09/05,18:00,等々力,川崎F,浦和,3,3
  準決勝,2021/10/06,19:00,豊田ス,名古屋,FC東京,3,1
  準決勝,2021/10/06,19:00,埼玉,浦和,C大阪,1,1
  準決勝,2021/10/10,14:00,味スタ,FC東京,名古屋,2,1
  準決勝,2021/10/10,15:00,ヨドコウ,C大阪,浦和,1,0
  決勝,2021/10/30,13:05,埼玉,名古屋,C大阪,2,0
CSV_TEXT

CSV.parse(prime_stage_data) do |row|
  round = Round.find_by(stage: prime_stage, name: row[0])
  round.matches.find_or_create_by!(
    category: 0,
    home_team: Team.find_by(club: Club.find_by(name_short: row[4]), start_year: 2021),
    away_team: Team.find_by(club: Club.find_by(name_short: row[5]), start_year: 2021),
    venue: Venue.find_by(name_short: row[3]),
    kickoff_at: Time.zone.parse("#{row[1]} #{row[2]}"),
    status: :complete,
    home_score: row[6],
    away_score: row[7]
  )
end
