class Admin::CategoriesController < ApplicationController

  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD']

  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    puts "Params are!: #{category_params}"
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'New Category Created!'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
