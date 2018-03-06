require 'rails_helper'

RSpec.feature 'Adding comments to movies' do
  before do
    @user = FactoryBot.create(:user)
    @movie = FactoryBot.create(:movie)
  end
  scenario 'permits authenticated user to add a comment' do
    login_as @user
    visit '/'
    click_link 'Movies'
    click_link @movie.title
    fill_in 'New Comment', with: 'Very good film!'
    click_button 'Add Comment'
    # save_and_open_page

    expect(page).to have_content('Comment has been created')
    expect(page).to have_content('Very good film!')
    expect(current_path).to eq(movie_path(@movie.id))
  end

  scenario 'does not permit authenticated user to add another comment for the same movie' do
    login_as @user
    visit '/'
    click_link 'Movies'
    click_link @movie.title
    fill_in 'New Comment', with: 'Very good film!'
    click_button 'Add Comment'

    click_link 'Movies'
    click_link @movie.title
    fill_in 'New Comment', with: 'Very good film indeed!'
    click_button 'Add Comment'
    # save_and_open_page
    expect(page).to have_content('You can submit only one review per movie!')
    expect(current_path).to eq(movie_path(@movie.id))
  end
end
