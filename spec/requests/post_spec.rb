require 'rails_helper'
RSpec.describe 'Posts', type: :request do
  let!(:user) do
    User.create(
      name: 'Pascal',
      photo: 'https://images.unsplash.com/photo-1660911295696-9810c266d9f2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYW
            dlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
      bio: 'Bacon ipsum dolor amet pork loin chislic porchetta, biltong bresaola jerky bacon tail swine pancetta
        ham prosciutto beef. Frankfurter burgdoggen corned beef buffalo
            landjaeger meatloaf
            chuck kevin sausage shankle meatball. Tongue frankfurter capicola hamburger. Picanha'
    )
  end
  let!(:post) do
    Post.create(author: user, title: 'How to eat fish', text: 'you open your moth slowly, this is a lie')
  end

  context 'when GET /index' do
    before { @posts = post }
    before(:example) { get user_posts_path(user.id) }

    it 'should have success code of ok' do
      expect(response).to have_http_status(:ok)
    end

    it "should render the 'index' template" do
      expect(response).to render_template(:index)
    end
  end
  context 'when GET /show' do
    before(:example) { get user_post_path(user, post) }

    it 'should have success code of ok' do
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('you open your moth slowly, this is a lie')
    end

    it "should render the 'show' template" do
      expect(response).to render_template(:show)
      expect(response.body).to include('you open your moth slowly, this is a lie')
    end
  end
end
