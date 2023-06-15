class PostPlacetagRelation < ApplicationRecord
  belongs_to :post_event
  belongs_to :place
end
