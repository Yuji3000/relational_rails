require 'rails_helper'
##As a visitor
#When I visit '/child_table_name/:id'
#Then I see the child with that id including
# the child's attributes
#(data from each column that is on the child table)

RSpec.describe 'stores show' do
  before:each do
    @factory_1 = Factory.create!(name: "Socks 4 u", operational: true, rank: 14) #factory_1
    @factory_2 = Factory.create!(name: "The Helpful Factory", operational: true, rank: 3) #factory_2
    @store_1 = @factory_2.stores.create!(name: "The Helpful Store", open: true, sold_per_month: 1234, factory_id: @factory_2.id)
    @store_2 = @factory_2.stores.create!(name: "Laugh House", open: true, sold_per_month: 313, factory_id: @factory_2.id)
    @store_3 = @factory_1.stores.create!(name: "Sock House", open: true, sold_per_month: 333, factory_id: @factory_1.id) 
  end
  describe 'As a user' do
    describe "'when I visit '/stores/:id'" do
      it 'shows a store with all columns/attributes' do
    
        visit "/stores/#{@store_1.id}"

        expect(page).to have_content(@store_1.name)
        expect(page).to have_content(@store_1.open)
        expect(page).to have_content("Open: true")
        expect(page).to have_content(@store_1.sold_per_month)
        expect(page).to have_content("Sold per month: 1234")
        expect(page).to have_content(@store_1.created_at)
        expect(page).to have_content("Created at: #{@store_1.created_at}")
        expect(page).to have_content(@store_1.updated_at)
        expect(page).to have_content(@store_1.id)
        expect(page).to have_content("ID: #{@store_1.id}")
      end
      
      it 'can link to update store' do
        visit "/stores/#{@store_1.id}"
    
        click_on("Update Store")

        expect(current_path).to eq("/stores/#{@store_1.id}/edit")
      end
    end
  end
end