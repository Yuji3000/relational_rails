require 'rails_helper'

RSpec.describe 'Factories Stores index' do
  before :each do 
    @factory_1 = Factory.create!(name: "Socks 4 u", operational: true, rank: 14) #factory_1
    @factory_2 = Factory.create!(name: "The Helpful Factory", operational: true, rank: 3) #factory_2
    @store_1 = @factory_2.stores.create!(name: "The Helpful Store", open: true, sold_per_month: 1234, factory_id: @factory_2.id)
    @store_2 = @factory_2.stores.create!(name: "Laugh House", open: true, sold_per_month: 313, factory_id: @factory_2.id)
    @store_3 = @factory_1.stores.create!(name: "Sock House", open: true, sold_per_month: 333, factory_id: @factory_1.id) 
  end

  describe 'As a visitor' do
    describe "When I visit '/factories/:factory_id/stores'" do
      it 'shows each store associated with that factory with attributes' do
        visit "/factories/#{@factory_2.id}/stores"
        
        expect(page).to have_content(@store_1.name)
        expect(page).to have_content(@store_1.open)
        expect(page).to have_content(@store_1.sold_per_month)
        expect(page).to have_content(@store_1.created_at)
        expect(page).to have_content(@store_1.updated_at)
        expect(page).to have_content(@store_1.id)

        # visit "/factories/#{socks.id}/stores"

        # expect(page).to have_content(hehe.name)
        # expect(page).to have_content(hehe.operational)
        # expect(page).to have_content(hehe.sold_per_month)
        # expect(page).to have_content(hehe.created_at)
        # expect(page).to have_content(hehe.updated_at)
      end

      it 'has a link that goes to create new store form' do
        visit "/factories/#{@factory_1.id}/stores"

        expect(page).to have_link("Create Store")
        
        click_link("Create Store")
        expect(current_path).to eq("/factories/#{@factory_1.id}/stores/new")
      end
    end
  end
end
