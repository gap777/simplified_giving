require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validations' do
    subject { build :user }

    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :email }
  end

  it 'can participate in many gift exchanges' do
    user = create :user
    exchanges = create_list :gift_exchange, 3
    exchanges.first.participants << user
    exchanges.second.participants << user
    exchanges.third.participants << user
    expect(user.participatory_gift_exchanges).to eq exchanges
  end
end
