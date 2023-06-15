class Zb < ApplicationRecord


  #Tagsテーブルから中間テーブルに対する関連付け
  has_many :post_zbtag_relations, dependent: :destroy
  #Tagsテーブルから中間テーブルを介してArticleテーブルへの関連付け
  has_many :post_events, through: :post_zbtag_relations, dependent: :destroy

  # 空で保存できないバリテーション
  with_options presence: true do
    validates :zb_name
  end

end
