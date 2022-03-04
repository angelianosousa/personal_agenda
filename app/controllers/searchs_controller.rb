class SearchsController < ApplicationController
  def boards
    @boards = Board.where("title LIKE ?", params[:title]).includes(:tasks)
  end
end
