require 'rails_helper'

RSpec.describe User do
  let(:user) { subject }

  it { should have_many(:animals) }

  it "is invalid when non-unique" do
    some_user = build(:user, name: "Lauren", email: "lauren@example.com")
    some_user.save
    user = build(:user, name: "Lauren", email: "lauren@example.com")
    expect(user).to be_invalid
  end

  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  it { should have_many(:appointments) }

end
