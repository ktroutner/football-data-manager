# frozen_string_literal: true

require 'csv'

# Name,Abbreviation,English name,English abbreviation,Prefecture
data = <<~CSV_TEXT
  エディオンスタジアム広島,Eスタ,Edion Stadium Hiroshima,Hiroshima,34
  IAIスタジアム日本平,アイスタ,IAI Stadium Nihondaira,Nihondaira,22
  県立カシマサッカースタジアム,カシマ,Kashima Soccer Stadium,Kashima,8
  ニッパツ三ツ沢球技場,ニッパツ,NHK Spring Mitsuzawa Football Stadium,Mitsuzawa,14
  ノエビアスタジアム神戸,ノエスタ,Noevir Stadium Kobe,Kobe,28
  パナソニック スタジアム 吹田,パナスタ,Panasonic Stadium Suita,Suita,27
  ベスト電器スタジアム,ベススタ,Best Denki Stadium,Best Denki,40
  ヤンマースタジアム長居,ヤンマー,Yanmar Stadium Nagai,Nagai,28
  ユアテックスタジアム仙台,ユアスタ,Yurtec Stadium Sendai,Sendai,4
  ヨドコウ桜スタジアム,ヨドコウ,Yodoko Sakura Stadium,Yodoko,28
  レモンガススタジアム平塚,レモンS,Lemon Gas Stadium Hiratsuka,Hiratsuka,14
  三協フロンテア柏スタジアム,三協F柏,Sankyo Frontier Kashiwa Stadium,Kashiwa,12
  味の素スタジアム,味スタ,Ajinomoto Stadium,Ajinomoto,13
  埼玉スタジアム2002,埼玉,Saitama Stadium 2002,Saitama,11
  日産スタジアム,日産ス,Nissan Stadium,Nissan,14
  昭和電工ドーム大分,昭和電ド,Showa Denko Dome Oita,Oita Dome,44
  札幌ドーム,札幌ド,Sapporo Dome,Sapporo Dome,1
  札幌厚別公園競技場,札幌厚別,Sapporo Atsubetsu Stadium,Sapporo Atsubetsu,1
  浦和駒場スタジアム,浦和駒場,Urawa Komaba Stadium,Urawa Komaba,11
  等々力陸上競技場,等々力,Kawasaki Todoroki Stadium,Todoroki,14
  豊田スタジアム,豊田ス,Toyota Stadium,Toyota,23
  駅前不動産スタジアム,駅スタ,Ekimae Real Estate Stadium,Ekimae,41
  鳴門・大塚スポーツパーク ポカリスエットスタジアム,鳴門大塚,Pocari Sweat Stadium,Pocari,36
CSV_TEXT

CSV.parse(data) do |row|
  stadium = Stadium.create!(
    name: row[0],
    name_short: row[1],
    name_en: row[2],
    name_short_en: row[3],
    prefecture: row[4]
  )
  Match.where(stadium: row[1]).each do |match|
    match.update!(stadium_id: stadium.id)
  end
end
