require 'rails_helper'

RSpec.describe 'Gift exchanges', type: :system do

  let(:user) { create :user }
  let(:name) { 'My Exchange' }
  let(:description) { 'A description of my exchange' }
  let(:event_date) { Date.current + 1.month }

  before :each do
    sign_in user
  end

  it 'allows a user to create a gift exchange' do
    visit new_gift_exchange_path
    fill_in 'Name', with: name
    fill_in 'Description', with: description
    fill_in 'Event date', with: event_date
    click_button 'Create Gift exchange'
    expect(page).to have_content 'Gift exchange was successfully created.'
    expect(page).to have_content name
    new_gift_exchange = GiftExchange.last
    expect(new_gift_exchange.name).to eq name
    expect(new_gift_exchange.description).to eq description
    expect(new_gift_exchange.event_date).to eq event_date
  end

  it 'allows a user to edit a gift exchange' do
    gift_exchange = create :gift_exchange, owner: user
    visit edit_gift_exchange_path(gift_exchange)
    fill_in 'Name', with: name
    fill_in 'Description', with: description
    fill_in 'Event date', with: event_date
    click_button 'Update Gift exchange'
    expect(page).to have_content 'Gift exchange was successfully updated.'
  end
end