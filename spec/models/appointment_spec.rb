require 'rails_helper'

RSpec.describe Appointment do

  describe "validations" do
    it { is_expected.to validate_presence_of(:date) }
    it { is_expected.to validate_presence_of(:time) }
  end

  it "has a valid factory" do
    expect(build(:appointment)).to be_valid
  end

  it 'belongs to a user' do
    expect(described_class.new).to belong_to(:user)
  end
end
