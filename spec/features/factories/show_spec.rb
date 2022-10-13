require 'rails_helper'

RSpec.describe 'the factories show page' do
  describe 'as a user' do
    describe 'when I visit a factory show page' do
      it 'displays the factory attributes' do
        socks = Factory.create!(name: "Socks 4 u", operational: true, rank: 14)
        helpful = Factory.create!(name: "The Helpful Factory", operational: true, rank: 3)

        visit "/factories/#{socks.id}"

        expect(page).to have_content(socks.name)
        expect(page).to have_content(socks.operational)
        expect(page).to have_content(socks.rank)
      end
    end
  end
end
