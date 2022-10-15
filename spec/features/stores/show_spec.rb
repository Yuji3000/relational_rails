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
        helpful_store = Store.create!(name: "The Helpful Store", open: true, sold_per_month: 1234)
        sock_store = Store.create!(name: "Sock House", open: true, sold_per_month: 333)
      
        visit "/stores/#{helpful_store.id}"

        expect(page).to have_content(helpful_store.name)
        expect(page).to have_content(helpful_store.open)
        expect(page).to have_content("Open: true")
        expect(page).to have_content(helpful_store.sold_per_month)
        expect(page).to have_content("Sold per month: 1234")
        expect(page).to have_content(helpful_store.created_at)
        expect(page).to have_content("Created at: #{helpful_store.created_at}")
        expect(page).to have_content(helpful_store.updated_at)
        expect(page).to have_content(helpful_store.id)
        expect(page).to have_content("ID: #{helpful_store.id}")
      end
    end
  end
end