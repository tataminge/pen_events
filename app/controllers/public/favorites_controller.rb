class Public::FavoritesController < ApplicationController
  before_action :authenticate_member!


  def create
    @post_event = PostEvent.find(params[:post_event_id])
    favorite = current_member.favorites.new(post_event_id: @post_event.id)
    favorite.save
  end

  def destroy
    @post_event = PostEvent.find(params[:post_event_id])
    favorite = current_member.favorites.find_by(post_event_id: @post_event.id)
    favorite.destroy
  end


end
