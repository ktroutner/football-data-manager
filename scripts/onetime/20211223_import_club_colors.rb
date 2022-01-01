# frozen_string_literal: true

require 'csv'

# Club,Color code,Color name,English color name,Type
data = <<~CSV_TEXT
  札幌,#c3001a,コンサドーレレッド,Consadole Red,primary
  札幌,#000000,コンサドーレブラック,Consadole Black,secondary
  札幌,#ffffff,コンサドーレホワイト,Consadole White,highlight
  札幌,#013950,コンサドーレブルーグレイ,Consadole Blue-Gray,secondary
  仙台,#fcc902,ベガルタゴールド,Vegalta Gold,primary
  仙台,#2c4298,ベガルタブルー,Vegalta Blue,secondary
  仙台,#d7040e,ベガルタレッド,Vegalta Red,secondary
  鹿島,#b8193f,アントラーズレッド,Antlers Reｄ,primary
  鹿島,#102b49,,,highlight
  鹿島,#beb2a8,,,highlight
  浦和,#e6002d,レッド,Red,primary
  浦和,#000000,,,highlight
  浦和,#ffffff,,,highlight
  柏,#fffe05,イエロー,Yellow,primary
  柏,#000000,,,highlight
  FC東京,#254294,ブルー,Blue,primary
  FC東京,#c50030,レッド,Red,secondary
  川崎F,#23b7fe,サックスブルー,Saxe Blue,primary
  川崎F,#000000,ブラック,Black,highlight
  川崎F,#ffffff,ホワイト,White,highlight
  横浜FM,#e60039,レッド,Red,secondary
  横浜FM,#ffffff,ホワイト,White,secondary
  横浜FM,#004098,ブルー,Blue,primary
  横浜FC,#29a0ea,水色,Light Blue,primary
  横浜FC,#ffffff,白,White,secondary
  横浜FC,#063786,青,Blue,secondary
  湘南,#6eb92b,ライトグリーン,Light Green,primary
  湘南,#135ca2,ブルー,Blue,secondary
  湘南,#ffffff,ホワイト,White,secondary
  清水,#ff8709,オレンジ,Orange,primary
  清水,#002555,マリーンブルー,Marine Blue,secondary
  名古屋,#d70c19,バーバリアンレッド,Barbarian Red,primary
  名古屋,#ea5503,ノーブルレッド,Noble Red,highlight
  名古屋,#f39703,スターオレンジ,Star Orange,secondary
  G大阪,#053287,ブルー,Blue,primary
  G大阪,#000000,ブラック,Black,secondary
  G大阪,#a98532,ゴールド,Gold,highlight
  G大阪,#ffffff,ホワイト,White,highlight
  C大阪,#da005c,ピンク,Pink,primary
  C大阪,#161e82,,,secondary
  神戸,#9b0020,クリムゾンレッド,Crimson Red,primary
  神戸,#000000,黒,Black,secondary
  神戸,#ffffff,白,White,secondary
  広島,#51318f,紫,Purple,primary
  広島,#bf9c47,,,highlight
  徳島,#101184,藍,Indigo,primary
  徳島,#5c861e,緑,Green,secondary
  徳島,#f70506,赤,Red,highlight
  徳島,#ffff,,,highlight
  福岡,#011b5a,ネイビー,Navy,secondary
  福岡,#2796b1,ブルーヴェールダンス,Blue Vert Dense,primary
  福岡,#a0a0a0,シルバー,Silver,secondary
  鳥栖,#039be5,サガンブルー,Sagan Blue,primary
  鳥栖,#ea549a,サガンピンク,Sagan Pink,secondary
  大分,#140b8c,ブルー,Blue,primary
  大分,#ffb606,イエロー,Yellow,secondary
CSV_TEXT

CSV.parse(data) do |row|
  club = Club.find_by(name_short: row[0])
  club.colors.find_or_create_by!(code: row[1], name: row[2], name_en: row[3], category: row[4])
end
