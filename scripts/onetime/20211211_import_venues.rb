# frozen_string_literal: true

require 'csv'

# Name,Abbreviation,English name,English abbreviation,Prefecture,City,English city
data = <<~CSV_TEXT
  エディオンスタジアム広島,Eスタ,Edion Stadium Hiroshima,Hiroshima,34,広島市,Hiroshima
  IAIスタジアム日本平,アイスタ,IAI Stadium Nihondaira,Nihondaira,22,静岡市,Shizuoka
  県立カシマサッカースタジアム,カシマ,Kashima Soccer Stadium,Kashima,8,鹿嶋市,Kashima
  ニッパツ三ツ沢球技場,ニッパツ,NHK Spring Mitsuzawa Football Stadium,Mitsuzawa,14,横浜市,Yokohama
  ノエビアスタジアム神戸,ノエスタ,Noevir Stadium Kobe,Kobe,28,神戸市,Kobe
  パナソニックスタジアム吹田,パナスタ,Panasonic Stadium Suita,Suita,27,吹田市,Suita
  ベスト電器スタジアム,ベススタ,Best Denki Stadium,Best Denki,40,福岡市,Fukuoka
  ヤンマースタジアム長居,ヤンマー,Yanmar Stadium Nagai,Nagai,28,大阪市,Osaka
  ユアテックスタジアム仙台,ユアスタ,Yurtec Stadium Sendai,Sendai,4,仙台市,Sendai
  ヨドコウ桜スタジアム,ヨドコウ,Yodoko Sakura Stadium,Yodoko,28,大阪市,Osaka
  レモンガススタジアム平塚,レモンS,Lemon Gas Stadium Hiratsuka,Hiratsuka,14,平塚,Hiratsuka
  三協フロンテア柏スタジアム,三協F柏,Sankyo Frontier Kashiwa Stadium,Kashiwa,12,柏市,Kashiwa
  味の素スタジアム,味スタ,Ajinomoto Stadium,Ajinomoto,13,調布市,Chofu
  埼玉スタジアム2002,埼玉,Saitama Stadium 2002,Saitama,11,さいたま市,Saitama
  日産スタジアム,日産ス,Nissan Stadium,Nissan,14,横浜市,Yokohama
  昭和電工ドーム大分,昭和電ド,Showa Denko Dome Oita,Oita Dome,44,大分市,Oita
  札幌ドーム,札幌ド,Sapporo Dome,Sapporo Dome,1,札幌市,Sapporo
  札幌厚別公園競技場,札幌厚別,Sapporo Atsubetsu Stadium,Sapporo Atsubetsu,1,札幌市,Sapporo
  浦和駒場スタジアム,浦和駒場,Urawa Komaba Stadium,Urawa Komaba,11,さいたま市,Saitama
  等々力陸上競技場,等々力,Kawasaki Todoroki Stadium,Todoroki,14,川崎市,Kawasaki
  豊田スタジアム,豊田ス,Toyota Stadium,Toyota,23,豊田市,Toyota
  駅前不動産スタジアム,駅スタ,Ekimae Real Estate Stadium,Ekimae,41,鳥栖市,Tosu
  鳴門・大塚スポーツパーク ポカリスエットスタジアム,鳴門大塚,Pocari Sweat Stadium,Pocari,36,鳴門市,Naruto
CSV_TEXT

CSV.parse(data) do |row|
  Venue.create!(
    name: row[0],
    name_en: row[2],
    name_short: row[1],
    name_short_en: row[3],
    country: Country.new(:japan),
    prefecture: Prefecture.new(Prefecture::VALUES.key(row[4].to_i)),
    city: row[5],
    city_en: row[6]
  )
end
