module Admin

    class UserPolicy < ApplicationPolicy

        def index?
            user.admin_role?
        end
  
        def show?
            user.admin_role?
        end
  
        def create?
            user.admin_role?
        end
  
        def new?
            create?
        end
  
        def update?
            user.admin_role?
        end
  
        def edit?
            update?
        end
  
        def destroy?
            user.admin_role?
        end
    end
  end