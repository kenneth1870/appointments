module Admin
  class AppointmentsController < Admin::BaseController
    before_action :set_user
    before_action :set_appointment, only: [:show, :edit, :update, :destroy]

    def index
      @appointments = @user.appointments
    end

    def new
      @appointment = @user.appointments.build
    end

    def edit
    end

    def create
      @appointment = @user.appointments.build(appointment_params)
      respond_to do |format|
        if @appointment.save
          format.html { redirect_to admin_user_appointments_path(@user, @account) }
        else
          format.html { render :new }
        end
      end
    end

    def update
      respond_to do |format|
        if @appointment.update(appointment_params)
          format.html { redirect_to admin_user_appointments_path(@user, @account) }
        else
          format.html { render :edit }
        end
      end
    end
    def destroy
      @appointment.destroy
      respond_to do |format|
        format.html { redirect_to  admin_user_appointments_path(@user, @account), notice: 'Appointment was successfully destroyed.' }
        format.json { head :no_content }
      end
    end


    private
      def set_user
        @user = User.find(params[:user_id])
      end

      def set_appointment
        @appointment = @user.appointments.find(params[:id])
      end

      def appointment_params
        params.require(:appointment).permit(:user_id, :date)
      end
  end
end
