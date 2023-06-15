class Place < ApplicationRecord

  #placesテーブルから中間テーブルに対する関連付け
  has_many :post_placetag_relations, dependent: :destroy
  #Placesテーブルから中間テーブルを介してPost_eventsテーブルへの関連付け
  has_many :post_events, through: :post_placetag_relations, dependent: :destroy


    # 空で保存できないバリテーション
  with_options presence: true do
    validates :place
  end

end
