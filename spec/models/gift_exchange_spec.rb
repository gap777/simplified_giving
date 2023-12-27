require 'rails_helper'

RSpec.describe GiftExchange, type: :model do
  it 'has an owner' do
    exchange = create :gift_exchange
    expect(exchange.owner).to be_a User
    exchange.update(owner: nil)
    expect(exchange).to_not be_valid
  end

  it 'has many participants' do
    exchange = create :gift_exchange
    users = create_list :user, 3
    exchange.participants << users
    expect(exchange.participants).to eq users
  end
end
