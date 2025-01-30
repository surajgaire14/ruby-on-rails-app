class SubscriberController < ApplicationController
    allow_unauthenticated_access
    before_action :set_product

    def create
        @product.subscribers.create(subscribers_params).first_or_create
        redirect_to @product, notice: "You  have successfullly subscribed to this product"
    end

    private
    def set_product
        @product = Product.find(params[:product_id])
    end

    def subscribers_params
        params.expect(subscriber: [:email])
    end
    
end
