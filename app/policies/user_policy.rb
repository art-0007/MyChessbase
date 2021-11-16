class UserPolicy < ApplicationPolicy

    def index?
        false
    end
  
    def show?
        true
    end
  
    def create?
      !user.guest?
    end
  
    def new?
      create?
    end
  
    def update?
        record ==user
    end
  
    def edit?
      update?
    end
  
    def destroy?
        user.author?(record)
    end
  
  end