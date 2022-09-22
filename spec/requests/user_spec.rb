require 'rails_helper'
RSpec.describe 'Users', type: :request do
  context 'For GET /index path' do
    before(:example) { get users_path }

    it 'it should have success code 200' do
      expect(response).to have_http_status(:ok)
    end

    it "it should render 'index.html.erb' template" do
      expect(response).to render_template(:index)
    end
  end
  context 'For when GET /show' do
    let!(:user) do
      User.create(
        name: 'Pascal',
        photo: 'https://images.unsplash.com/photo-1660911295696-9810
            c266d9f2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
        bio: 'Bacon ipsum dolor amet pork loin chislic porchetta, biltong bresaola jerky bacon tail swine pancetta
            ham prosciutto beef. Frankfurter burgdoggen corned beef buffalo
            landjaeger meatloaf chuck kevin sausage shankle meatball. Tongue frankfurter capicola hamburger. Picanha'
      )
    end
    before(:example) { get user_path(user.id) }

    it 'should have success code of ok' do
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Pascal')
    end

    it "It should render the 'show' template" do
      expect(response).to render_template(:show)
      expect(response.body).to include('Pascal')
    end
  end
end
