require 'rails_helper'

RSpec.describe Store, type: :model do
  it {should belong_to :factory}
  describe 'instance methods' do
    describe '#is_true' do
      it 'returns only stores that are open' do
        factory_1 = Factory.create!(name: "Socks 4 u", operational: true, rank: 14)
        factory_2 = Factory.create!(name: "The Helpful Factory", operational: true, rank: 3)
        
        store_1 = Store.create!(name: "The Helpful Store",
          open: true,
          sold_per_month: 1234,
          factory_id: factory_1.id)
        store_2 = Store.create!(name: "Laugh House",
          open: true,
          sold_per_month: 313,
          factory_id: factory_1.id)
        store_3 = Store.create!(name: "Sad House",
          open: false,
          sold_per_month: 313,
          factory_id: factory_2.id)
        expect(Store.is_open).to eq([store_1, store_2])
      end
    end
  end
end