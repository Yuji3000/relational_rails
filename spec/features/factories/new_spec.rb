# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.

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