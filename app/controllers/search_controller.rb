class SearchController < ApplicationController

  def search
  	@user = current_user
  	@book = Book.new
  	@search = Book.ransack(params[:q])
    @results = @search.result
  end

end
