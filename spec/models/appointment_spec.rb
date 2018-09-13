require 'rails_helper'

RSpec.describe Appointment do
  let(:appointment) { subject }

  describe "validations" do
    it { is_expected.to validate_presence_of(:date) }
    it { is_expected.to validate_presence_of(:time) }
  end

  it 'belongs to a user' do
    user = create(:user)
    appointment.user = user
    appointment.save

    expect(user.appointments).to include(appointment)
  end
end
