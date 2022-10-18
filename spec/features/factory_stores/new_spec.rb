require 'rails_helper'

RSpec.describe 'the store creation' do
  before :each do 
    @factory_1 = Factory.create!(name: "Socks 4 u", operational: true, rank: 14) #factory_1
    
  end

  it 'can create a new factory' do
    visit "/factories/#{@factory_1.id}/stores/new"
    fill_in('Name', with: 'Prince Store')
    fill_in('Open', with: 'true')
    fill_in('sold_per_month', with: '14')
    click_button('Add Store')

    expect(current_path).to eq("/factories/#{@factory_1.id}/stores")
    
    visit "/factories/#{@factory_1.id}/stores"
    
    expect(page).to have_content("Name: Prince Store")
    expect(page).to have_content("Open: true")
    expect(page).to have_content("Sold per month: 14")
  end
end