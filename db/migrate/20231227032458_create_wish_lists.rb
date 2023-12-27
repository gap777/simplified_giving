class CreateWishLists < ActiveRecord::Migration[7.1]
  def change
    create_table :wish_lists, primary_key: [:participant_id, :gift_exchange_id] do |t|
      t.references :participant, null: false, foreign_key: { to_table: :users }
      t.references :gift_exchange, null: false, foreign_key: true
      t.timestamps
    end
  end
end
