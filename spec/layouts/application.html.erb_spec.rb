require 'rails_helper'

RSpec.describe 'layouts/application', type: :view do
  describe 'As a visitor when I visit any page on the site' do
    it 'should display stores page' do
      render
      expect(rendered).to have_selector(:css, 'a[href="/stores/"]')
      #to have_link
    end
    it 'should display factories page' do
      render
      # save_and_open_page
      expect(rendered).to have_selector(:css, 'a[href="/factories/"]')
      # click_link(' factories ')
      # expect(current_path).to eq('/factories/')
    end
  end
end