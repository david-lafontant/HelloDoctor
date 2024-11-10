require 'rails_helper'

RSpec.describe Patient, type: :model do
  let(:patient) { FactoryBot.build(:patient) }
  context 'Should not be valid' do # rubocop:disable Metrics/BlockLength
    it 'when email is not present' do
      patient.email = nil
      expect(patient).not_to be_valid
    end

    it 'when email is not invalid' do
      patient.email = 'roberto badgio'
      expect(patient).not_to be_valid
    end

    it 'when first_name is not present' do
      patient.first_name = nil
      expect(patient).not_to be_valid
    end

    it 'when first_name is less than 2 charcaters' do
      patient.first_name = 'z'
      expect(patient).not_to be_valid
    end

    it 'when first_name is greater than 20 characters' do
      patient.first_name = 'loremipsumloremipsumloremipsumloremipsumloremipsum'
      expect(patient).not_to be_valid
    end

    it 'when last_name is not present' do
      patient.last_name = nil
      expect(patient).not_to be_valid
    end

    it 'when last_name is less than 2 charcaters' do
      patient.last_name = 'z'
      expect(patient).not_to be_valid
    end

    it 'when last_name is greater than 20 characters' do
      patient.last_name = 'loremipsumloremipsumloremipsumloremipsumloremipsum'
      expect(patient).not_to be_valid
    end

    it 'when address_line1 is not present' do
      patient.address_line1 = nil
      expect(patient).not_to be_valid
    end

    it 'when address_line1 is less than 6 charcaters' do
      patient.address_line1 = 'rue'
      expect(patient).not_to be_valid
    end

    it 'when address_line1 is greater than 70 characters' do
      patient.address_line1 = 'loremipsumloremipsumloremipsumloremipsumloremipsumloremipsumloremipsumloremipsumloremipsumloremipsum'
      expect(patient).not_to be_valid
    end

    it 'when address_line2 is not present' do
      patient.address_line2 = nil
      expect(patient).not_to be_valid
    end

    it 'when address_line2 is less than 6 charcaters' do
      patient.address_line2 = 'rue'
      expect(patient).not_to be_valid
    end

    it 'when address_line2 is greater than 70 characters' do
      patient.address_line2 = 'loremipsumloremipsumloremipsumloremipsumloremipsumloremipsumloremipsumloremipsumloremipsumloremipsum'
      expect(patient).not_to be_valid
    end

    it 'when patient sex is not present' do
      patient.sex = nil
      expect(patient).not_to be_valid
    end

    it 'when patient phone is in incorrect format' do
      patient.phone = 182_829_299_283_838_838_838_837_688_388_376_879
      expect(patient).not_to be_valid
    end
  end
end

RSpec.describe Patient, type: :model do
  let(:patient) { FactoryBot.build(:patient) }
  let(:user) { FactoryBot.build(:user) }

  context 'user id' do
    it 'should return No Liaison for this patien twhen user is not present' do
      patient.user = nil
      expect(patient.user_id).to eq nil
      expect(patient).not_to be_valid
    end

    it 'should return user id when user is present' do
      patient.user = user
      expect(patient.user_id).to eq user.id
    end
  end
end
