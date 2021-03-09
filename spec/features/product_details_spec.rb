require 'rails_helper'

# RSpec.feature "ProductDetails", type: :feature do
#   pending "add some scenarios (or delete) #{__FILE__}"
# end

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see info of the selected product" do
      # ACT
      visit root_path
      first('.product').click_link('Details')
  
      expect(page).to have_css 'article.product-detail', count: 1
      # DEBUG / VERIFY
      # commented out b/c it's for debugging only
      # save_screenshot
      # puts page.html
  end
end
