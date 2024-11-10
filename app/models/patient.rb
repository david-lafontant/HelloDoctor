class Patient < ApplicationRecord
  belongs_to :user
  enum sex: %i[female male].freeze
  validates :first_name, :last_name, :birthdate, :sex, :address_line1, :address_line2, :city,
            :state, :country, :phone, :email, :user_id, presence: true
  validates :first_name, :last_name, length: { in: 2..20 }
  validates :address_line1, :address_line2, length: { in: 6..70 }
  validates :email,
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: 'Invalid format' }

  validates :phone,
            format: { with: /([0-9\s\-]{7,})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?\z/, message: 'Invalid format' }
end
