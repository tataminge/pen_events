class Public::PostEventsController < ApplicationController
  # before_action :authenticate_member!
  before_action :ensure_member, {only: [:edit, :update, :destroy]}


  def index
    @post_events  = PostEvent.all
  end

  def by_genre
    @genre = Genre.find(params[:genre_id])
    @post_events = @genre.post_events
  end

  def show
    @post_event = PostEvent.find(params[:id])
  end


  def new
    @post_event = PostEvent.new
  end

  def create
    @post_event = PostEvent.new(post_event_params)
    @post_event.member_id = current_member.id
    if @post_event.save
      redirect_to public_post_event_path(@post_event.id)
    else
      render :new
    end
  end


  def edit
    @post_event = PostEvent.find(params[:id])
  end

  def update
    @post_event = PostEvent.find(params[:id])
    @post_event.update(post_event_params)
    redirect_to public_post_event_path(@post_event.id)
  end

  def destroy
    @post_event = PostEvent.find(params[:id])
    @post_event.destroy
    redirect_to public_member_path(current_member.id)
  end



  private

  def ensure_member
  	@post_event = PostEvent.find(params[:id])
  	if @post_event.member_id != current_member.id
		  flash[:notice] = "権限がありません"
		  redirect_to public_post_events_path
	  end
  end

   def post_event_params
     params.require(:post_event).permit(:genre_id, :image, :title, :start_date, :end_date, :body, :url, zb_ids: [], place_ids: [])
   end





end
