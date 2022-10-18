require 'rails_helper'

RSpec.describe 'stores edit' do
  before :each do
    @factory_1 = Factory.create!(name: "Socks 4 U", operational: true, rank: 14) #factory_1
    @factory_2 = Factory.create!(name: "The Helpful Factory", operational: true, rank: 3) #factory_2
    @store_1 = @factory_2.stores.create!(name: "The Helpful Storee", open: true, sold_per_month: 1234, factory_id: @factory_2.id)
    @store_2 = @factory_2.stores.create!(name: "Laugh House", open: true, sold_per_month: 313, factory_id: @factory_2.id)
    @store_3 = @factory_1.stores.create!(name: "Sock House", open: true, sold_per_month: 333, factory_id: @factory_1.id) 
  end
  describe 'As a user' do
    describe 'when I visit stores show edit page' do
      it 'can edit stores' do

        visit "/stores/#{@store_1.id}"
        expect(page).to have_content("The Helpful Storee")
        
        click_link("Update Store")
        
        fill_in 'name', with: 'The Helpful Store'
        fill_in 'open', with: true
        fill_in 'sold_per_month', with: '1234'
        click_on 'Edit Store'
        
        expect(current_path).to eq("/stores/#{@store_1.id}")
        expect(page).to have_content("The Helpful Store")
      end
    end
  end
end