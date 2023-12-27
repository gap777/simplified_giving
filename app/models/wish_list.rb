class WishList < ApplicationRecord
  belongs_to :participant, class_name: 'User'
  belongs_to :gift_exchange
  validates_presence_of :participant, :gift_exchange
  validates_uniqueness_of :participant_id, scope: :gift_exchange_id
end
