# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#アドミン初期登録
Admin.create!(
   email: 'admin@gmail.com',
   password: 'adminpass',
)

# ジャンル初期登録
Genre.create!(genre: "カフェ")
Genre.create!(genre: "広告")
Genre.create!(genre: "グッズ系")


# メンバー初期登録
Zb.create!(zb_name: "ZB1")
Zb.create!(zb_name: "ジャンハオ")
Zb.create!(zb_name: "ソンハンビン")
Zb.create!(zb_name: "ソクマシュー")
Zb.create!(zb_name: "リッキー")
Zb.create!(zb_name: "パクゴヌク")
Zb.create!(zb_name: "キムテレ")
Zb.create!(zb_name: "キムギュビン")
Zb.create!(zb_name: "キムジウン")
Zb.create!(zb_name: "ハンユジン")

#開催地初期登録
Place.create!(place: "日本/東京")
Place.create!(place: "日本/大阪")
Place.create!(place: "日本/その他")
Place.create!(place: "韓国")
Place.create!(place: "その他")
