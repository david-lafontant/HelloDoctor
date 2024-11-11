class PublicsController < ApplicationController
  def index; end

  def doctor
    @page = 'doctor'
    sort_column = params[:sort] || 'created_at'
    sort_direction = params[:direction].presence_in(%w[asc desc]) || 'desc'
    @patients = Patient.order("#{sort_column} #{sort_direction}").page(params[:page]).per(10)
  end

  def receptionist
    @page = 'receptionist'

    sort_column = params[:sort] || 'created_at'
    sort_direction = params[:direction].presence_in(%w[asc desc]) || 'desc'

    @patients = Patient.order("#{sort_column} #{sort_direction}").page(params[:page]).per(10)
  end
end
