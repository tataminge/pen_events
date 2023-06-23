class Zb < ApplicationRecord
  include PgSearch::Model


  #Tagsテーブルから中間テーブルに対する関連付け
  has_many :post_zbtag_relations, dependent: :destroy
  #Tagsテーブルから中間テーブルを介してArticleテーブルへの関連付け
  has_many :post_events, through: :post_zbtag_relations, dependent: :destroy

  # 空で保存できないバリテーション
  with_options presence: true do
    validates :zb_name
  end


  pg_search_scope :search_by_zb_name,
                against: :zb_name,
                using: {
                  tsearch: { prefix: true }
                }

end
