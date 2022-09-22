require 'rails_helper'

RSpec.describe 'All post index pages', type: :system do
  before do
    driven_by(:rack_test)
    @user = User.create(name: 'Pascal', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @post = Post.create(title: 'Bizimungu', text: 'This is my first post', author: @user)
    Comment.create(author: @user, post: @post, text: 'First comment')
    Comment.create(author: @user, post: @post, text: 'Second comment')
    Like.create(post: @post, author: @user)
  end
  it 'The profile picture should be shown' do
    visit user_posts_path(@user)
    expect(page).to have_css("img[src*='#{@user.photo}']")
  end
  it 'The user name should be shouwn' do
    visit user_posts_path(@user)
    expect(page).to have_content(@user.name)
  end
  it 'It should shows number of posts for the user' do
    visit user_posts_path(@user)
    expect(page).to have_content("Number of posts: #{@user.posts_count}")
  end
  it 'It should shows a post\'s title' do
    visit user_posts_path(@user)
    expect(page).to have_content(@post.title)
  end
  it 'It should shows a post\'s body' do
    visit user_posts_path(@user)
    expect(page).to have_content(@post.text)
  end
  it 'It should shows first comment on the post' do
    visit user_posts_path(@user)
    expect(page).to have_content('First comment')
  end
  it 'It shold shows the number of comments' do
    visit user_posts_path(@user)
    expect(page).to have_content("Comments: #{@post.comments_count}")
  end
  it 'It shoud shows the number of likes' do
    visit user_posts_path(@user)
    expect(page).to have_content("Likes: #{@post.likes_count}")
  end
end
