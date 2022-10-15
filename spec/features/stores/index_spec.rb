require 'rails_helper'

RSpec.describe 'stores index' do
  describe 'As a user' do
    describe "'when I visit '/stores'" do
      it 'shows all stores with attributes' do
        # helpful = Factory.create!(name: "The Helpful Factory", operational: true, rank: 3)
        # socks = Factory.create!(name: "Socks 4 u", operational: true, rank: 14)
        helpful_store = Store.create!(name: "The Helpful Store", open: true, sold_per_month: 1234)
        sock_store = Store.create!(name: "Sock House", open: true, sold_per_month: 333)
      
        visit "/stores"

        expect(page).to have_content(helpful_store.name)
        expect(page).to have_content(helpful_store.open)
        expect(page).to have_content("Open: true")
        expect(page).to have_content(helpful_store.sold_per_month)
        expect(page).to have_content("Sold per month: 1234")
      end
    end
  end
end



# User Story 3, Child Index 

# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system 
# including the Child's attributes
# (data from each column that is on the child table)
