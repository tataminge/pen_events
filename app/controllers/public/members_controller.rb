class Public::MembersController < ApplicationController
    before_action :authenticate_member!
    # before_action :set_member, only: [:favorites]

  def show
    @member = current_member
    @post_events = @member.post_events
  end

  def edit
    @member = current_member
  end

  def update
    member = current_member
    if member.update(member_params)
      redirect_to public_members_path, notice: '更新が完了いたしました。'
    else
      redirect_to edit_public_member_path, notice: '更新できませんでした。'
    end
  end

  def index
    @member = current_member
    favorites= Favorite.where(member_id: @member.id).pluck(:post_event_id)
    @post_events= PostEvent.find(favorites)
  end


  private

  # def set_member
    # @member = Member.find(params[:id])
  # end

  def member_params
    params.require(:member).permit(:name)
  end


end
