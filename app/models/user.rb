class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable

  enum role: %i[receptionist doctor].freeze
  validates :email, :password, :role, presence: true
  validates :password, length: { in: 10..40 }

  after_initialize :set_default_role, if: :new_record?

  private

  def set_default_role
    self.role ||= :receptionist
  end
end
