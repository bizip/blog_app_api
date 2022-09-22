require 'rails_helper'
RSpec.describe 'UserShowPages', type: :system do
  before do
    driven_by(:rack_test)
    @user = User.create(name: 'Darwin', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    Post.create(title: 'Hello', text: 'This is my first post', author: @user)
    Post.create(title: 'Hello2', text: 'This is my second post', author: @user)
    Post.create(title: 'Hello3', text: 'This is my first post', author: @user)
    Post.create(title: 'Hello4', text: 'This is my second post', author: @user)
  end
  it 'shows user profile picture' do
    visit user_path(@user)
    expect(page).to have_css("img[src*='#{@user.photo}']")
  end
  it 'shows the username the user' do
    visit user_path(@user)
    expect(page).to have_content(@user.name)
  end
  it 'shows number of posts for the user' do
    visit user_path(@user)
    expect(page).to have_content("Number of posts: #{@user.posts_count}")
  end
  it "shows the user's bio" do
    visit user_path(@user)
    expect(page).to have_content(@user.bio)
  end
end
