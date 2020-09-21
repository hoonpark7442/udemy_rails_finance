class FriendshipsController < ApplicationController
  def create
  	friend = User.find(params[:friend])
  	current_user.friendships.build(friend_id: friend.id)
  	if current_user.save
  		flash[:notice] = "success"
  	else	
  		flash[:error] = "error"
  	end
  	redirect_to my_friends_path
  end

  def destroy
  	friendship = current_user.friendships.where(friend_id: params[:id]).first
  	friendship.destroy
  	flash[:notice] = "stop followng"
  	redirect_to my_friends_path
  end
end
