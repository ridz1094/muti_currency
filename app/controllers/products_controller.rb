class ProductsController < ApplicationController

    before_action :set_product, only: [:update, :show]

    def index
        Product.price_by_geolocation(request.remote_ip)
        @products = Product.all
        render json: @products
    end

    def show
        if !@product.present?
            render json: {errors: "Product not found"}, status: 404
        else
            Product.price_by_geolocation(request.remote_ip)
            render json: @product
        end
    end


    private

    def set_product
        if params[:id].present?
            @product = Product.find_by_id(params[:id])
        end
    end

end
