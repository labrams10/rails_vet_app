require 'rails_helper'

RSpec.describe AnimalsController do
  describe 'GET #new' do
    it "renders the new animal form" do
      user = create(:user)
      get :new, params: { user_id: user.id }
      expect(response).to render_template('animals/new')
    end
  end

  # describe "GET #index" do
  #   it "assigns @animals" do
  #     animal = create(:animal)
  #     binding.pry
  #     get :index, params: {user_id: animal.user_id }
  #     expect(assigns(:animals)).to eq([animal])
  #   end

  #   it "renders the index template" do
  #     get :index
  #     expect(response).to render_template("index")
  #   end
  # end
end
