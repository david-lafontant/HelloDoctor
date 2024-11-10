require 'rails_helper'

RSpec.describe '/patients', type: :request do
  receptionist ||= User.create(email: 'doctor@hellodoctor.com',
                               password: 'password12345',
                               password_confirmation: 'password12345',
                               confirmed_at: Time.now.utc,
                               role: 0)
  let(:patient) { FactoryBot.create(:patient) }

  context 'Get /Index' do
    it 'should render index page' do
      sign_in receptionist
      get patients_path
      expect(response).to render_template :index
    end
  end

  context 'Get /New' do
    it 'should render new page' do
      sign_in receptionist
      get new_patient_path
      expect(response).to render_template :new
    end
  end

  context 'Get /Edit' do
    it 'should render edit page' do
      sign_in receptionist
      get edit_patient_path(patient)
      expect(response).to render_template :edit
    end

    it 'should not create a patient with invalid attributes' do
      sign_in receptionist
      post '/patients', params: { patient: FactoryBot.attributes_for(:patient, first_name: nil) }
      expect(response).to render_template :new
      expect(flash[:notice]).to eq nil
    end
  end

  context 'Put /patient' do
    it 'should update a patient with valid attributes' do
      sign_in receptionist
      put "/patients/#{patient.id}", params: { patient: FactoryBot.attributes_for(:patient, last_name: 'pipa') }
      expect(response).to redirect_to patient_url(patient)
      expect(flash[:notice]).to eq 'Patient was successfully updated.'
    end

    it 'should not update a patient with invalid attributes' do
      sign_in receptionist
      put "/patients/#{patient.id}", params: { patient: FactoryBot.attributes_for(:patient, size: nil) }
      expect(response).to redirect_to patient_url(patient)
      expect(flash[:notice]).to eq 'Patient was successfully updated.'
    end
  end

  context 'Delete /patient' do
    it 'should destroy a patient' do
      sign_in receptionist
      delete "/patients/#{patient.id}"
      expect(response).to redirect_to patients_path
      expect(flash[:notice]).to eq 'Patient was successfully destroyed.'
    end
  end
end
