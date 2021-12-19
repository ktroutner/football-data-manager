# frozen_string_literal: true

require 'csv'

# Team name,Abbreviation,English team name,English abbrevation,Prefecture
data = <<~CSV_TEXT
  北海道コンサドーレ札幌,札幌,Hokkaido Consadole Sapporo,CON,1
  ベガルタ仙台,仙台,Vegalta Sendai,VEG,4
  鹿島アントラーズ,鹿島,Kashima Antlers,KAS,8
  浦和レッズ,浦和,Urawa Reds,URA,11
  柏レイソル,柏,Kashiwa Reysol,KAR,12
  FC東京,FC東京,F.C. Tokyo,TOK,13
  川崎フロンターレ,川崎F,Kawasaki Frontale,KAW,14
  横浜F・マリノス,横浜FM,Yokohama F.Marinos,YOK,14
  横浜FC,横浜FC,Yokohama FC,YFC,14
  湘南ベルマーレ,湘南,Shonan Bellmare,SHO,14
  清水エスパルス,清水,Shimizu S-Pulse,SHI,22
  名古屋グランパス,名古屋,Nagoya Grampus,NAG,23
  ガンバ大阪,G大阪,Gamba Osaka,GAM,27
  セレッソ大阪,C大阪,Cerezo Osaka,CER,27
  ヴィッセル神戸,神戸,Vissel Kobe,VIS,28
  サンフレッチェ広島,広島,Sanfrecce Hiroshima,HIR,34
  徳島ヴォルティス,徳島,Tokushima Vortis,TVO,36
  アビスパ福岡,福岡,Avispa Fukuoka,AVI,40
  サガン鳥栖,鳥栖,Sagan Tosu,SAG,41
  大分トリニータ,大分,Oita Trinita,OIT,44
CSV_TEXT

j1_2021 = Competition.find_by(series: CompetitionSeries.find_by(name_short: 'J1'), start_year: 2021)
j1_2021_league = j1_2021.stages.first.groups.first

CSV.parse(data) do |row|
  club = Club.find_or_create_by!(
    name: row[0],
    name_en: row[2],
    name_short: row[1],
    name_short_en: row[3],
    country: Country.new(:japan),
    prefecture: Prefecture.new(Prefecture::VALUES.key(row[4].to_i))
  )
  team = club.teams.find_or_create_by!(start_year: 2021, end_year: 2021)
  competition_team = j1_2021.competition_teams.find_or_create_by!(team: team)
  j1_2021_league.group_teams.find_or_create_by!(team: competition_team)
end
