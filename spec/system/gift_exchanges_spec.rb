require 'rails_helper'

RSpec.describe 'Gift exchanges', type: :system do

  let(:user) { create :user }
  before :each do
    sign_in user
  end

  it 'allows a user to create a gift exchange' do
    visit new_gift_exchange_path
    fill_in 'Name', with: 'My Exchange'
    fill_in 'Description', with: 'A description of my exchange'
    fill_in 'Event date', with: Date.current + 1.month
    click_button 'Create Gift exchange'
    expect(page).to have_content 'Gift exchange was successfully created.'
  end
end