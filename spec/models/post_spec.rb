require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.create(name: 'Sam', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Dj.')

  subject do
    Post.new(author: user, title: 'How to test ruby', text: 'some tesxt')
  end

  before { subject.save }

  it 'it should describe title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'it should return recent comments' do
    Comment.create(post: subject, author: user, text: 'some test')
    comments = subject.recent_comments_on_post
    expect(comments.length).to eq 1
  end
end
