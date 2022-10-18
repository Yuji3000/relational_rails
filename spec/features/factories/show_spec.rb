require 'rails_helper'

RSpec.describe 'the factories show page' do
  describe 'as a user' do
    describe 'when I visit a factory show page' do
      it 'displays the factory attributes' do
        socks = Factory.create!(name: "Socks 4 u",
          operational: true,
          rank: 14)
        helpful = Factory.create!(name: "The Helpful Factory",
          operational: true,
          rank: 3)

        visit "/factories/#{socks.id}"
        
        expect(page).to have_content(socks.name)
        expect(page).to have_content(socks.operational)
        expect(page).to have_content(socks.rank)

        visit "factories/#{helpful.id}"

        expect(page).to have_content(helpful.name)
        expect(page).to have_content(helpful.operational)
        expect(page).to have_content(helpful.rank)
      end

      it 'should display stores page that belong to those factories' do
        factory_1 = Factory.create!(name: "The Helpful Factory", operational: true, rank: 3)

        store_1 = Store.create!(name: "The Helpful Store", open: true,
          sold_per_month: 1234,
          factory_id: factory_1.id)
        store_2 = Store.create!(name: "Laugh House",
          open: true,
          sold_per_month: 313,
          factory_id: factory_1.id)
        
        visit "/factories/#{factory_1.id}"
# save_and_open_page
        click_link ('Stores that belong to This factory')
        expect(current_path).to eq("/factories/#{factory_1.id}/stores")
      end
      it 'when click link update factory goes to edit page' do
        factory_1 = Factory.create!(name: "The Helpful Factory", operational: true, rank: 3)

        store_1 = Store.create!(name: "The Helpful Store", open: true,
          sold_per_month: 1234,
          factory_id: factory_1.id)
        store_2 = Store.create!(name: "Laugh House",
          open: true,
          sold_per_month: 313,
          factory_id: factory_1.id)
        
        visit "/factories/#{factory_1.id}"
        
        click_link ('Update Factory')
        expect(current_path).to eq("/factories/#{factory_1.id}/edit")
      end

   
    end
  end
end
