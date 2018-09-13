require 'rails_helper'

RSpec.describe AppointmentsController do
  describe 'GET #new' do
    it "renders the new appointment form" do
      user = create(:user)
      get :new, params: { user_id: user.id }
      expect(response).to render_template('appointments/new')
    end
  end
end
