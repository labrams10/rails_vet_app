require 'rails_helper'

RSpec.describe AppointmentsController do
  describe 'GET #new' do
    it "renders the new appointment form" do
      user = create(:user)
      get :new, params: { user_id: user.id }
      expect(response).to render_template('appointments/new')
    end
  end

  describe 'GET #index' do
    it 'shows a users appointments if logged in' do
      user = create(:user)
      session[:user_id] = user.id
      get :index, params: {user_id: user.id}
      expect(response.status).to eq(200)
    end
  end
end
