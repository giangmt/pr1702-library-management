class CategoriesController < ApplicationController
  def show
    @category = Author.find_by id: params[:id]
    redirect_to root_url if @category.nil?
  end
end
