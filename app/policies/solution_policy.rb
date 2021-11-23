# frozen_string_literal: true

class SolutionPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    #binding.pry
    true
  end

  def new?
    create?
  end

  def update?
    #binding.pry
    true
  end

  def edit?
    update?
  end

  def destroy?
    user.admin_role? || user.author?(record)
  end
end
