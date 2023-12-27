require 'rails_helper'

RSpec.describe WishList, type: :model do
  describe 'validations' do
    subject { build :wish_list }

    it { should validate_presence_of :participant }
    it { should validate_presence_of :gift_exchange }
    it { should validate_uniqueness_of(:participant_id).scoped_to(:gift_exchange_id) }
  end
end
