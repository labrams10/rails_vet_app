require 'rails_helper'

RSpec.describe Animal do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:weight) }
    it { is_expected.to validate_presence_of(:breed) }
    it { is_expected.to validate_presence_of(:age) }
  end

  it 'belongs to a user' do
    expect(described_class.new).to belong_to(:user)
  end

  it { should have_many(:foodbrands) }

  it "has a valid factory" do
    expect(build(:animal)).to be_valid
  end

end
