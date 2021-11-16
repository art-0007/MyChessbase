class PuzzlePolicy < ApplicationPolicy

    def index?
        true
    end
  
    def show?
        true
    end
  
    def create?
      user.present?
    end
  
    def new?
      create?
    end
  
    def update?
      false
    end
  
    def edit?
      update?
    end
  
    def destroy?
      false
    end
  
  end