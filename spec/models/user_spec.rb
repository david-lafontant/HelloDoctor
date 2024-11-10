require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) }
  context 'Should not be valid' do
    it 'when email is not present' do
      user.email = nil
      expect(user).not_to be_valid
    end

    it 'when password is not present' do
      user.password = nil
      expect(user).not_to be_valid
    end

    it 'when password is less than 10 charcaters' do
      user.password = 'zoe'
      expect(user).not_to be_valid
    end

    it 'when password is greater than 40 characters' do
      user.password = 'loremipsumloremipsumloremipsumloremipsumloremipsum'
      expect(user).not_to be_valid
    end

    it 'when user role is not present' do
      user.role = nil
      expect(user).not_to be_valid
    end
  end

  context 'should have correct default value' do
    it 'user role is receptionist' do
      expect(user.role).to eq('receptionist')
    end
  end
end
