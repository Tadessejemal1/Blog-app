require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before(:each) do
    @user = User.create(name: 'Tadesse Jemal', photo: 'https://unsplash.com/photos/mateopic',
                        bio: 'Software Developer, Ethiopian, I like to cook', posts_counter: 5)
  end

  describe 'GET /users' do
    before(:each) { get users_path(@user) }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
  end

  describe 'GET /users/1' do
    before(:each) { get user_path(@user) }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'show' template" do
      expect(response).to render_template('show')
    end

    it 'page contains text' do
      expect(response.body).to include('Tadesse Jemal')
      expect(response.body).to include('Software Developer, Ethiopian, I like to cook')
      expect(response.body).to_not include('Angel')
    end
  end
end
