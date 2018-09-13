require 'rails_helper'

RSpec.describe AnimalsController do
  describe 'GET #new' do
    it "renders the new animal form" do
      user = create(:user)
      get :new, params: { user_id: user.id }
      expect(response).to render_template('animals/new')
    end
  end

  describe 'GET #index' do
    it 'shows a users animals if logged in' do
      user = create(:user)
      session[:user_id] = user.id
      get :index, params: {user_id: user.id}
      expect(response.status).to eq(200)
    end
  end

  it { should use_before_action(:set_animal) }
end
