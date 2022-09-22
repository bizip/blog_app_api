require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.create(name: 'Sam', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Dj.')
  post = Post.create(author: user, title: 'Music', text: 'hipop')

  subject { Comment.new(post: post, author: user, text: 'some comments') }

  before { subject.save }

  it 'comment should be one 1' do
    expect(post.comments_count).to eq 1
  end
end
