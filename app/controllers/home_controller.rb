class HomeController < ApplicationController
  def index
    @shots = []
    1.upto(3) do |page_no|
     @shots <<  DribbbleService.get_gifs_for_page(page_no, params[:type])
    end
    @shots.flatten!
  end

  def about

  end
end
