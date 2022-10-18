require 'rails_helper'

RSpec.describe 'stores index' do
  before :each do
    @factory_1 = Factory.create!(name: "Socks 4 u", operational: true, rank: 14)
    @factory_2 = Factory.create!(name: "The Helpful Factory", operational: true, rank: 3)
    
    @store_1 = Store.create!(name: "The Helpful Store", open: true, sold_per_month: 1234, factory_id: @factory_1.id)
    @store_2 = Store.create!(name: "Laugh House", open: true, sold_per_month: 313, factory_id: @factory_1.id)
    @store_3 = Store.create!(name: "Sad House", open: false, sold_per_month: 313, factory_id: @factory_2.id)
    end

  describe 'As a user' do
    describe "'when I visit '/stores'" do
      it 'shows all stores with attributes' do
        
        visit "/stores"

        expect(page).to have_content(@store_1.name)
        expect(page).to have_content(@store_1.open)
        expect(page).to have_content("Open: true")
        expect(page).to have_content(@store_1.sold_per_month)
        expect(page).to have_content("Sold per month: 1234")
      end

      it 'stores index only shows open stores' do
    
        visit "/stores"
    
        expect(page).to have_content("The Helpful Store")
        expect(page).to have_content("Laugh House")
        expect(page).not_to have_content("Sad House") 
      end
    end
  end
end



