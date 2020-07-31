class RecipePolicy < ApplicationPolicy
 def show?
    owned?
  end

  def new?
    owned?
  end

  def create?
    owned?
  end

  def update?
   owned?
  end

  def edit?
    owned?
  end

  def destroy?
    owned?
  end

  private

  def owned?
    user == @record.user
  end
end
