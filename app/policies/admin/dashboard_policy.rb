module Admin
  class DashboardPolicy < Struct.new(:user, :dashboard)
    def show?
      false
    end
  end
end
