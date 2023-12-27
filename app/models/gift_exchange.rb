class GiftExchange < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_and_belongs_to_many :participants,
                          class_name: 'User',
                          join_table: :gift_exchange_users,
                          foreign_key: :gift_exchange_id,
                          association_foreign_key: :participant_id
  validates_presence_of :name, :owner, :event_date, :description
end
