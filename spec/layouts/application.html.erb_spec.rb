require 'rails_helper'

RSpec.describe 'layouts/application', type: :view do
  describe 'As a visitor when I visit any page on the site' do
    it 'should display stores page' do
      render
      expect(rendered).to have_selector(:css, 'a[href="/stores/"]')
    end
    it 'should display factories page' do
      render
      expect(rendered).to have_selector(:css, 'a[href="/factories/"]')
    end
  end
end