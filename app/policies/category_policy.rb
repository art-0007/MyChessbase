# frozen_string_literal: true

class CategoryPolicy < ApplicationPolicy
  def index?
    true
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
    user.admin_role? || user.moderator_role? || user.author?(record)
  end

  def edit?
    update?
  end

  def destroy?
    user.admin_role? || user.author?(record)
  end
end
