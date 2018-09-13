require 'rails_helper'

RSpec.describe Animal do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:weight) }
    it { is_expected.to validate_presence_of(:breed) }
    it { is_expected.to validate_presence_of(:age) }
  end

  it 'belongs to a user' do
    user = create(:user)
    animal = create(:animal, user: user)

    expect(user.animals).to include(animal)
  end

  it 'has many foodbrands' do
    animal = create(:animal)
    foodbrand = Foodbrand.create

    animal.foodbrands << foodbrand
    animal.save

    expect(foodbrand.animal).to eq(animal)
  end

end
