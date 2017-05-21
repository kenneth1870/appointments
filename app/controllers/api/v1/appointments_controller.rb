module Api::V1
  class AppointmentsController < Api::V1::ApiController
    before_action :set_user, only: [:show]
    before_action :set_appointment, only: [:show]

    def index
      @appointments =  Appointment.all
      render json: @appointments
    end
    def show
      render json: @appointment
    end

    private
    def set_user
      @user = User.find(params[:user_id])
    end

    def set_appointment
      @appointment = @user.appointments.find(params[:id])
    end
  end
end
