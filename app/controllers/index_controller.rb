class IndexController < ApplicationController
  # get /
  def index
    @collection = Program.page_for_visitors
  end
end
