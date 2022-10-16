require 'rails_helper'
##As a visitor
#When I visit '/child_table_name/:id'
#Then I see the child with that id including
# the child's attributes
#(data from each column that is on the child table)

RSpec.describe 'stores show' do
  describe 'As a user' do
    describe "'when I visit '/stores/:id'" do
      it 'shows a store with all columns/attributes' do
        factory_1 = Factory.create!(name: "The Helpful Factory",
          operational: true,
           rank: 3,
            created_at: 5.seconds.ago)
        store_1 = Store.create!(name: "The Helpful Store", open: true, sold_per_month: 1234, factory_id: factory_1.id)
        store_2 = Store.create!(name: "Sock House", open: true, sold_per_month: 333, factory_id: factory_1.id)
      
        visit "/stores/#{store_1.id}"

        expect(page).to have_content(store_1.name)
        expect(page).to have_content(store_1.open)
        expect(page).to have_content("Open: true")
        expect(page).to have_content(store_1.sold_per_month)
        expect(page).to have_content("Sold per month: 1234")
        expect(page).to have_content(store_1.created_at)
        expect(page).to have_content("Created at: #{store_1.created_at}")
        expect(page).to have_content(store_1.updated_at)
        expect(page).to have_content(store_1.id)
        expect(page).to have_content("ID: #{store_1.id}")
      end
    end
  end
end