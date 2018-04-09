class AuthorsController < ApplicationController
  def show
    @author = Author.find_by id: params[:id]
    redirect_to root_url if @author.nil?
  end
end
