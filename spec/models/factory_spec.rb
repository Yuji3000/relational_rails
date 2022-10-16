require 'rails_helper'

RSpec.describe Factory, type: :model do
  it {should have_many :stores}

  describe 'instance methods' do
    describe 'order_created_at' do
      it 'orders factories by created at time' do
        socks = Factory.create!(name: "Socks 4 u",
           operational: true,
            rank: 14,
             created_at: 10.seconds.ago)
        helpful = Factory.create!(name: "The Helpful Factory",
           operational: true,
            rank: 3,
             created_at: 5.seconds.ago)
        expect(Factory.order_created_at).to eq([helpful, socks])
      end
    end
  end
end