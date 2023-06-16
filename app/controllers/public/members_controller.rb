class Public::MembersController < ApplicationController
    before_action :authenticate_member!
    before_action :set_member, only: [:favorites]

  def show
  end

  def edit
  end

  def index
    favorites = Favorite.where(member_id: @member.id).pluck(:post_event_id)
    @favorite_posts = Post_event.find(favorites)
  end


  private

  def set_member
    @member = Member.find(params[:id])
  end


end
