class Admin::DashboardController < ApplicationController
  def show
    @product_count = Product.count
    @category = Category.all()
  end
end
