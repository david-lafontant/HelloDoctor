class PublicsController < ApplicationController
  def index; end

  def doctor
    @page = 'doctor'
  end

  def receptionist
    @page = 'receptionist'
    @patients = Patient.order(created_at: :desc).page(params[:page])
  end
end
