class HomeController < ApplicationController
  def index
      @appointments =  current_user&.appointments&.order("created_at DESC")
  end
end
