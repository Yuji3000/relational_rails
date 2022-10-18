require 'rails_helper'
RSpec.describe 'Factories index' do
  before :each do
    @factory_1 = Factory.create!(name: "Socks 4 U", operational: true, rank: 14) #factory_1
    @factory_2 = Factory.create!(name: "The Helpful Factory", operational: true, rank: 3) #factory_2
    @store_1 = @factory_2.stores.create!(name: "The Helpful Storee", open: true, sold_per_month: 1234, factory_id: @factory_2.id)
    @store_2 = @factory_2.stores.create!(name: "Laugh House", open: true, sold_per_month: 313, factory_id: @factory_2.id)
    @store_3 = @factory_1.stores.create!(name: "Sock House", open: true, sold_per_month: 333, factory_id: @factory_1.id) 
  end
  describe "As a user" do
    describe "When I visit '/factories'" do
      it ' shows all the the names of factories' do

        visit "/factories"

        expect(page).to have_content(@factory_1.name)
        expect(page).to have_content(@factory_2.name)
      end
    end
  end

  describe 'as a user' do
    describe "When I visit '/factories'" do
      it 'shows factories in order by created at time' do

        visit "/factories"

        expect(@factory_1.name).to appear_before(@factory_2.name)
      end

      it 'shows factories stores count' do
        # factory_1 = Factory.create!(name: "Socks 4 u", operational: true, rank: 14)
        # factory_2 = Factory.create!(name: "The Helpful Factory", operational: true, rank: 3)

        # store_1 = Store.create!(name: "The Helpful Store",
        #   open: true,
        #   sold_per_month: 1234,
        # factory_id: factory_1.id)
        # store_2 = Store.create!(name: "Laugh House",
        #   open: true,
        #   sold_per_month: 313,
        #   factory_id: factory_1.id)
        # store_3 = Store.create!(name: "Sad House",
        #   open: true,
        #   sold_per_month: 313,
        #   factory_id: factory_2.id)

          visit "/factories"
          
         expect(page).to have_content("2")
         expect(page).to have_content("1")

      end
    end
  end
end