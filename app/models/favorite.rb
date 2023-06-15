class Favorite < ApplicationRecord
  belongs_to :post_event
  belongs_to :member
end
