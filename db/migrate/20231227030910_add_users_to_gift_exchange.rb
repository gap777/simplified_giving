class AddUsersToGiftExchange < ActiveRecord::Migration[7.1]
  def change
    create_table :gift_exchange_users do |t|
      t.references :gift_exchange, null: false, foreign_key: true
      t.references :participant, null: false, foreign_key: { to_table: :users }
    end
  end
end
