class RecipePolicy < ApplicationPolicy
 def show?
    user_owner_of_record?
 end

  def new?
    create?
  end

  def create?
    user_owner_of_record?
  end

  def update?
   user_is_collaborator? || user_owner_of_record?
  end

  def edit?
    update?
  end

  def destroy?
    user_owner_of_record?
  end

  private

  def user_owner_of_record?
    record.user == user
  end

  def user_is_collaborator?
  if user.present?
  record_user_ids= record.collaborations.pluck(:user_id)
  record_user_ids.include?(user.id)
  end
  end
end
