class Admin::MembersController < ApplicationController
  before_action :authenticate_admin!

  def index
  end

  def show
    @member = Member.find(params[:id])
  end

  def destroy
    @post_event = PostEvent.find(params[:id])
    @post_event.destroy
    redirect_to admin_member_path(current_member.id)
  end

end
