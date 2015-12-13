class ProfilesController < ApplicationController

   #Main URL for list of users
   def index
      #creates an array of all users. Used by index html page
      @users = User.all
   end

   #individual URL for each user
   def show
      #creates a variable for selected user.  Used by show html page
      @user = User.find( params[:id])
   end
end
