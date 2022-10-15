require 'rails_helper'
RSpec.describe 'Factories index' do
  describe "As a user" do
    describe "When I visit '/factories'" do
      it ' shows all the the names of factories' do
        socks = Factory.create!(name: "Socks 4 u", operational: true, rank: 14)
        helpful = Factory.create!(name: "The Helpful Factory", operational: true, rank: 3)
    
        visit "/factories"

        expect(page).to have_content(socks.name)
        expect(page).to have_content(helpful.name)
      end
    end
  end

    describe 'as a user' do
      describe "When I visit '/factories'" do
        it 'shows factories in order by created at time' do
          socks = Factory.create!(name: "Socks 4 u", operational: true, rank: 14)
          helpful = Factory.create!(name: "The Helpful Factory", operational: true, rank: 3)

          visit "/factories"

          expect(socks.name).to appear_before(helpful.name)
        end
      end
    end
end