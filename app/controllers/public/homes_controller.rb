class Public::HomesController < ApplicationController

  def top
    @post_events  = PostEvent.all



  end

  def about
  end
end
