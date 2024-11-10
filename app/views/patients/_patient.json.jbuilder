json.extract! patient, :id, :first_name, :last_name, :birthdate, :sex, :address_line1, :address_line2, :city, :state, :country, :phone, :email, :user_id, :created_at, :updated_at
json.url patient_url(patient, format: :json)
