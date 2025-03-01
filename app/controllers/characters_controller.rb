class CharactersController < ApplicationController
  before_filter :authenticate

  def create
    @story = Story.find(params[:character][:story_id])
    current_user.follow!(@story)
    redirect_to @story
  end

  def destroy
    @story = Character.find(params[:id]).story_id
    current_user.unfollow!(@story)
    flash[:success] = "You have been removed from the story."
    redirect_to stories_path 
  end

end
