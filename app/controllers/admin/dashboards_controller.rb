class Admin::DashboardsController < Admin::BaseController
  before_action :authenticate_user!

  def index
    @users = User.where(role: 0)
    @appointments =  Appointment.includes(:user)
    @users_sessions = User.where('created_at >= :year_ago', :year_ago => 365.days.ago).count
  end

end
