require 'rails_helper'

RSpec.describe 'the Factory creation' do
  it 'links to the new page from the factories index' do
    
    visit '/factories'

    click_link('New Factory')

    expect(current_path).to eq('/factories/new')
  end

  it 'can create a new factory' do
    
    visit '/factories/new'

    fill_in('Name', with: 'Prince Factory')
    fill_in('Operational', with: 'true')
    fill_in('Rank', with: '14')
    click_button('Create Factory')

    expect(current_path).to eq("/factories")
    expect(page).to have_content('Prince Factory')
  end
end