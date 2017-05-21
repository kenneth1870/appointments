
module Admin
  class DashboardPolicy < Struct.new(:user, :dashboard)
    class Scope < Scope
      def resolve
        if user.admin?
          scope.all
        else
          redirect_to root_path
        end
      end
    end
  end
end
