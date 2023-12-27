require 'rails_helper'

RSpec.describe GiftExchange, type: :model do
  it 'has an owner' do
    exchange = create :gift_exchange
    expect(exchange.owner).to be_a User
    exchange.update(owner: nil)
    expect(exchange).to_not be_valid
  end
end
