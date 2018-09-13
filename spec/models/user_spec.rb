require 'rails_helper'

RSpec.describe User do
  let(:user) { subject }

  it 'has many animals' do
    animal = create(:animal)

    user.animals << animal
    user.save

    expect(animal.user).to eq(user)
  end

  it 'has many appointments' do
    appointment = create(:appointment)

    user.appointments << appointment
    user.save

    expect(appointment.user).to eq(user)
  end

end
