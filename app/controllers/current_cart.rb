MarketSayangroup::App.controllers :current_cart do

  module CurrentCart
    extend ActiveSupport::Concern

    private

      def set_cart 
        @cart = Cart.find(session[:cart_id])
      rescue DataMapper::ObjectNotFoundError
        @cart = Cart.create
        session[:cart_id] = @cart.id
      end
  end

end