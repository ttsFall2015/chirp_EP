class TweetsController < ApplicationController
  #Creates a varilable of the selected tweet object.  Uses the varilable 
  #on show, edit, update, and destroy html pages
 before_action :set_tweet, only: [:show, :edit, :update, :destroy]

 #checks to make sure the correct user is accessing the pages
 before_filter :authenticate_user!

  #Main Tweet page with list of all tweets
  def index
    #Array of all tweets.  Used for index html page
    @tweets = Tweet.all
  end

  #Individual tweet URL pages
  def show
  end

  #Deletes a tweet from the databse
  def destroy
    #deletes selected tweet
    @tweet.destroy

    #After tweet is deleted, redirects back to the main tweet URL 
    #Also, adds a notice to let the user know the tweet was deleted
    respond_to do |format |
      format.html {redirect_to tweets_url, notice: "Tweet was deleted" }
    end 
    
  end

  #URL page for updating a specific tweet
  def update

    respond_to do |format|
      #if the tweet was updated, redirects to the show page and issues a notice to the user
      if @tweet.update( tweet_params )
        format.html {redirect_to @tweet, notice: 'Tweet was successfully updated'}
      else
        #if the tweet does not update, user will stay on the edit page
        format.html {render :edit}
      end
    end

  end

  #URL for editing a specific tweet
  def edit  
  end

  #URL for creating a new tweet
  def new
    #Creates a new tweet object. Variable is used with the new html page
    @tweet = Tweet.new
  end

  #Create a new tweet and saves it to the database
  def create
    #Creates a new tweet with the info (params) from the new html page
    @tweet = Tweet.new(tweet_params)

    respond_to do |format|
      if @tweet.save
        #If tweet is able to save, redirects user to show page with notification
        format.html {redirect_to @tweet, notice: 'Tweet was successfully created.'}
      else
        #If tweet cannot save, user remains on new html page
        format.html {render :new}
      end
    end

  end

  #Private methods that cannot be accessed outside the class
  private

  #Use for new tweets. Requires there is a tweet object and allows the user to 
  #Update the message and id
  def tweet_params
    params.require(:tweet).permit(:message, :user_id)
  end

  #Creates a varilable of a specific tweet.  Used for html pages to view tweet info
  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end
