class Admin::BaseController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!
  before_filter :admin_filter!

  private
  def admin_filter!
    if current_user
      redirect_to root_path unless current_user.admin?
    end
  end
end
