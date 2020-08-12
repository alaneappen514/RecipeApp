require 'rails_helper'

describe RecipePolicy do
    subject { described_class }

    context "for a visitor" do
      let(:user)   { nil }
      let(:recipe) {FactoryBot.create(:random_recipe)}

      permissions :show?, :new?, :edit?, :create?, :update?, :destroy? do
        it "does not grant access for non logged in vistors" do
          expect(subject).not_to permit(user,recipe)
        end
      end
    end


    context "for a user viewing other users' recipes" do
        let(:user) {FactoryBot.create(:user2)}
        let(:recipe) {FactoryBot.create(:random_recipe)}

    
        permissions :edit?, :update?, :destroy? do
            it "denies access to user for whom the recipe does not belong" do
              expect(subject).not_to permit(user,recipe)
            end
        end
    end

  context "for a user editing own recipe and creating a new one" do
    let(:user) {FactoryBot.create(:user)}

    permissions :show?, :new?, :create?, :edit?, :update?, :destroy? do
        it "grants access if recipe belongs to user" do
          expect(subject).to permit(user, Recipe.create!(title:"Chicken Soup", ingredients:"chicken, chicken broth", description:"boil water and chicken broth", user_id: user.id))
        end
    end
 end

 context "for a collaborator to edit and update recipes" do
  let(:user2) {FactoryBot.create(:user2)}
  let(:recipe) {FactoryBot.create(:random_recipe)}

  permissions :edit?, :update? do
      it "grants access if the user is a collaborator" do
        expect(subject).to permit(user2, recipe)
      end
  end
end

end


