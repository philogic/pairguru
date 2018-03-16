require 'rails_helper'

RSpec.feature 'Getting topcomenters page' do
  before do
    FactoryBot.create_list(:user, 10, :with_comments)
  end
  scenario "Top Commenters page shows 10 users" do
    visit '/'
    click_link 'Top Commenters'
    save_and_open_page
    expect(page).to have_selector("table tr", count: 10)
  end
end