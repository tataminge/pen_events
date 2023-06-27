class PostEvent < ApplicationRecord
  belongs_to :genre
  belongs_to :member

  #post_eventsテーブルから中間テーブルに対する関連付け
  has_many :post_zbtag_relations, dependent: :destroy
  #post_eventsテーブルから中間テーブルを介してZbsテーブルへの関連付け
  has_many :zbs, through: :post_zbtag_relations, dependent: :destroy

  #post_eventsテーブルから中間テーブルに対する関連付け
  has_many :post_placetag_relations, dependent: :destroy
  #post_eventsテーブルから中間テーブルを介してplacesテーブルへの関連付け
  has_many :places, through: :post_placetag_relations, dependent: :destroy

  #いいね
  belongs_to :member
  has_many :favorites, dependent: :destroy


  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :url, format: { with: URI::DEFAULT_PARSER.make_regexp }
  end

   def favorited_by?(member)
     favorites.where(member_id: member.id).exists?
   end

  # # タグ検索
  # scope :with_zbs, ->(zbs_ids) { where(zbs_id: zbs_ids) }



end
