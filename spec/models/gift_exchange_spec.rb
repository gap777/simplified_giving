require 'rails_helper'

RSpec.describe GiftExchange, type: :model do
  describe 'validations' do
    subject { build :gift_exchange }

    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :owner }
    it { should validate_presence_of :event_date }
  end

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
