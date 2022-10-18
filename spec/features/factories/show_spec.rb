require 'rails_helper'

RSpec.describe 'the factories show page' do
  before :each do
    @factory_1 = Factory.create!(name: "Socks 4 u", operational: true, rank: 14)
    @factory_2 = Factory.create!(name: "The Helpful Factory", operational: true, rank: 3)
    
    @store_1 = Store.create!(name: "The Helpful Store", open: true, sold_per_month: 1234, factory_id: @factory_1.id)
    @store_2 = Store.create!(name: "Laugh House", open: true, sold_per_month: 313, factory_id: @factory_1.id)
    @store_3 = Store.create!(name: "Sad House", open: false, sold_per_month: 313, factory_id: @factory_2.id)
  end
  describe 'as a user' do
    describe 'when I visit a factory show page' do
      it 'displays the factory attributes' do

        visit "/factories/#{@factory_1.id}"
        
        expect(page).to have_content(@factory_1.name)
        expect(page).to have_content(@factory_1.operational)
        expect(page).to have_content(@factory_1.rank)

        visit "factories/#{@factory_2.id}"

        expect(page).to have_content(@factory_2.name)
        expect(page).to have_content(@factory_2.operational)
        expect(page).to have_content(@factory_2.rank)
      end

      it 'should display stores page that belong to those factories' do
  
        visit "/factories/#{@factory_1.id}"

        click_link ('Stores that belong to This factory')

        expect(current_path).to eq("/factories/#{@factory_1.id}/stores")
      end

      it 'when click link update factory goes to edit page' do
     
        visit "/factories/#{@factory_1.id}"
        
        click_link ('Update Factory')
        expect(current_path).to eq("/factories/#{@factory_1.id}/edit")
      end
    end
  end
end
