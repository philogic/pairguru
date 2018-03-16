require 'rails_helper'

describe 'TopCommenters requests', type: :request do
  describe 'Top comenters list' do
    it "should display the right title and subtitle" do
      visit '/topcommenters'
      expect(page).to have_selector("h1", text: "Hall Of Fame")
      expect(page).to have_selector("h3", text: "Users who created most comments")
    end
  end
end

