class CollaborationsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @user = User.where('email LIKE ?', "%#{params[:search]}%")
                .all_except(current_user)
                .exclude_collaborators(@recipe)
                .first
    if @user
      @collaboration = Collaboration.new(recipe: @recipe, user: @user)
      if @collaboration.save
        flash[:notice] = "User successfully added to Recipe"
    else 
        flash[:notice] = "There was a problem adding user"
      end
    else
      flash[:notice] = "Invalid email. Please try again."
    end
    redirect_to @recipe
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @collaboration = Collaboration.find(params[:id])
     respond_to do |format|
      if @collaboration.destroy
        format.html 
        format.js { flash[:notice] = "Member removed from Recipe"} 
       else
        format.html 
        format.js { flash[:notice] = "There was an error removing user"}
       end
       
    end
    
  end
end
