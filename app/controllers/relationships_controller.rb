class RelationshipsController < ApplicationController

   def create
    @relationship = current_user.relationships.build(friend_id: params[:friend_id])

    if @relationship.save 
      flash[:notice] = "Followed Succesfully"
      redirect_to profile_path(current_user.id)
    else 
      flash[:notice] = "Unable to Follow"
      redirect_to root_path
    end
  end

  def destroy
    @relationship = current_user.relationships.find(params[:id])
    @relationship.destroy
    flash[:notice] = "No Longer Following"
    redirect_to profile_path(current_user.id)
  end


  private 

  def relationship_params
   params.require(:relationship).permit(:friend_id, :user_id)
  end

end
