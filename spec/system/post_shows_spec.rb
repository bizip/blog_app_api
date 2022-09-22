require 'rails_helper'

RSpec.describe 'PostShows Spec', type: :system do
  before do
    driven_by(:rack_test)
    @user1 = User.create(name: 'Pascal', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @user2 = User.create(name: 'Bizimungu', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                         bio: 'Teacher from Mexico.')
    @post = Post.create(title: 'Hello', text: 'This is my first post', author: @user1)

    Comment.create(author: @user1, post: @post, text: 'First comment from my mind')
    Comment.create(author: @user2, post: @post, text: 'Second comment from my mind')

    Like.create(post: @post, author: @user1)
  end

  it 'It should shows a post\'s title' do
    visit user_post_path(@user1, @post)
    expect(page).to have_content(@post.title)
  end

  it 'It should shows the author of the post' do
    visit user_post_path(@user1, @post)
    expect(page).to have_content(@user1.name)
  end

  it 'It should shows the body of the post' do
    visit user_post_path(@user1, @post)
    expect(page).to have_content(@post.text)
  end

  it 'It should describe the user name of each comment' do
    visit user_post_path(@user1, @post)
    comment = @post.comments.first
    expect(page).to have_content(comment.author.name)
  end

  it 'It shows the comment each comment author left' do
    visit user_post_path(@user1, @post)
    comment = @post.comments.first
    comment2 = @post.comments.last
    expect(page).to have_content(comment.text)
    expect(page).to have_content(comment2.text)
  end
end
