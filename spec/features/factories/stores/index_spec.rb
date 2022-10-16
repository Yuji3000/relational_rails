require 'rails_helper'

RSpec.describe 'Factories Stores index' do
  describe 'As a visitor' do
    describe "When I visit '/factories/:factory_id/stores'" do
      it 'shows each store associated with that factory with attributes' do
        socks = Factory.create!(name: "Socks 4 u", operational: true, rank: 14) #factory_1
        helpful = Factory.create!(name: "The Helpful Factory", operational: true, rank: 3) #factory_2
        helpful_store = helpful.stores.create!(name: "The Helpful Store", open: true, sold_per_month: 1234, factory_id: helpful.id)
        hehe_store = helpful.stores.create!(name: "Laugh House", open: true, sold_per_month: 313, factory_id: helpful.id)
        sock_store = socks.stores.create!(name: "Sock House", open: true, sold_per_month: 333, factory_id: socks.id)
       
      
        visit "/factories/#{helpful.id}/stores"
        
        
        expect(page).to have_content(helpful_store.name)
        expect(page).to have_content(helpful_store.open)
        expect(page).to have_content(helpful_store.sold_per_month)
        expect(page).to have_content(helpful_store.created_at)
        expect(page).to have_content(helpful_store.updated_at)
        expect(page).to have_content(helpful_store.id)

        # visit "/factories/#{socks.id}/stores"

        # expect(page).to have_content(hehe.name)
        # expect(page).to have_content(hehe.operational)
        # expect(page).to have_content(hehe.sold_per_month)
        # expect(page).to have_content(hehe.created_at)
        # expect(page).to have_content(hehe.updated_at)
      end
    end
  end
end
