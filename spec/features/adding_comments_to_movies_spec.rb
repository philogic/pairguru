require 'rails_helper'

RSpec.feature 'Adding comments to movies' do
  before do
    @user = User.new(name: 'Peter', email: 'qba@example.com', password: 'nottoodifficultone1',
                         password_confirmation: 'nottoodifficultone1')
    @user.confirmed_at = Time.now
    @user.save
  end

  scenario 'permits authenticated user to add a comment' do
    login_as(@user)
    genre = FactoryBot.create(:genre)
    movie = FactoryBot.create(:movie)
    visit '/'
    click_link 'Movies'
    click_link movie.title
    fill_in 'New Comment', with: 'Very good film!'
    click_button 'Add Comment'

    expect(page).to have_content('Comment has been added.')
    expect(page).to have_content('Very good film!')
    expect(current_path).to eq(movie_path(@movie.id))
  end
end