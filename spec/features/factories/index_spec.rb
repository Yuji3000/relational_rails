require 'rails_helper'
RSpec.describe 'Factories index' do
  describe "As a user" do
    describe "When I visit '/factories'" do
      it ' shows all the the names of factories' do
        socks = Factory.create!(name: "Socks 4 u", operational: true, rank: 14)
        helpful = Factory.create!(name: "The Helpful Factory", operational: true, rank: 3)
    
        visit "/factories"

        expect(page).to have_content(socks.name)
        expect(page).to have_content(helpful.name)
      end
    end
  end

  describe 'as a user' do
    describe "When I visit '/factories'" do
      it 'shows factories in order by created at time' do
        factory_1 = Factory.create!(name: "Socks 4 u", operational: true, rank: 14)
        factory_2 = Factory.create!(name: "The Helpful Factory", operational: true, rank: 3)

        visit "/factories"

        expect(factory_1.name).to appear_before(factory_2.name)
      end

      it 'shows factories stores count' do
        factory_1 = Factory.create!(name: "Socks 4 u", operational: true, rank: 14)
        factory_2 = Factory.create!(name: "The Helpful Factory", operational: true, rank: 3)

        store_1 = Store.create!(name: "The Helpful Store",
          open: true,
          sold_per_month: 1234,
        factory_id: factory_1.id)
        store_2 = Store.create!(name: "Laugh House",
          open: true,
          sold_per_month: 313,
          factory_id: factory_1.id)
        store_3 = Store.create!(name: "Sad House",
          open: true,
          sold_per_month: 313,
          factory_id: factory_2.id)

          visit "/factories"
          
         expect(page).to have_content("2")
         expect(page).to have_content("1")

      end
    end
  end
end