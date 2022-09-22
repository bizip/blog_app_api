require 'rails_helper'

RSpec.describe 'All users Index Page', type: :system do
  before do
    driven_by(:rack_test)
    @user = User.create(name: 'Darwin', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  end

  it 'It should shows the username of all other users' do
    visit users_path
    expect(page).to have_content(@user.name)
  end

  it 'I should shows profile picture for each user' do
    visit users_path
    expect(page).to have_css("img[src*='#{@user.photo}']")
  end

  it 'Itt should shows number of posts for user' do
    Post.create(title: 'Hello', text: 'This is my first post', author: @user)
    Post.create(title: 'Hello2', text: 'This is my second post', author: @user)
    visit users_path
    expect(page).to have_content("Number of posts: #{@user.posts_count}")
  end
end
