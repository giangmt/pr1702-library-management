class PublishersController < ApplicationController
  def show
    @publisher = Author.find_by id: params[:id]
    redirect_to root_url if @publisher.nil?
  end
end
