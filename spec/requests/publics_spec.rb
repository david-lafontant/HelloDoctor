require 'rails_helper'

RSpec.describe 'Publics', type: :request do
  describe 'GET /index' do
    doctor ||= User.create(email: 'doctor@hellodoctor.com',
                           password: 'password12345',
                           password_confirmation: 'password12345',
                           confirmed_at: Time.now.utc,
                           role: 1)

    receptionist ||= User.create(email: 'doctor@hellodoctor.com',
                                 password: 'password12345',
                                 password_confirmation: 'password12345',
                                 confirmed_at: Time.now.utc,
                                 role: 0)

    it 'returns http success' do
      sign_in receptionist
      get '/'
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end
    it 'returns http success' do
      sign_in doctor
      get '/doctor'
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:doctor)
    end
    it 'returns http success' do
      sign_in receptionist
      get '/receptionist'
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:receptionist)
    end
  end
end
