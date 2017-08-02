class IndexController < ApplicationController
  # get /
  def index
    @filter = params[:filter] || Hash.new
    @collection = Program.page_for_visitors(current_page, @filter)
  end
end
