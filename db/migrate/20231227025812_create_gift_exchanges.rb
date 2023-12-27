class CreateGiftExchanges < ActiveRecord::Migration[7.1]
  def change
    create_table :gift_exchanges do |t|
      t.references :owner, null: false, foreign_key: { to_table: :users }
      t.string :name, null: false, default: ""
      t.string :description, null: false, default: ""
      t.date :event_date, null: false
      t.timestamps
    end
  end
end
