require 'rails_helper'

RSpec.describe 'the factory edit' do
  describe 'As a visitor' do
    it 'can edit the factory' do
      factory_1 = Factory.create!(name: "Princ", operational: true, rank: 1)

      visit "/factories/#{factory_1.id}"

      expect(page).to have_content("Princ")

      click_link("Update Factory")
      
      fill_in 'name', with: 'Prince'
      fill_in 'operational', with: true
      fill_in 'rank', with: '1'
      click_on 'edit Factory'

      expect(current_path).to eq("/factories/#{factory_1.id}")
      expect(page).to have_content("Prince")
    end
  end
end