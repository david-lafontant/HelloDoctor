class PublicsController < ApplicationController
  def index; end

  def doctor
    @page = 'doctor'
  end

  def receptionist
    @page = 'receptionist'
  end
end
