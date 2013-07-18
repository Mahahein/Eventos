class ProductsController < ApplicationController
 before_filter :authenticate_user!
  def index
    @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to products_url }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to products_url }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
    end
  end
  
end
