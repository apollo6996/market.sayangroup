# Helper methods defined here can be accessed in any controller or view in the application

module MarketSayangroup
  class App
    module CartItemHelper
      # def simple_helper_method
      # ...
      # end

      def set_cart 
        if session[:cart_id]
          @cart = Cart.get(session[:cart_id])
        else
          @cart = Cart.create
          session[:cart_id] = @cart.id
        end
      end

      def create
        item = Item.get(params[:item_id])
        @cart_item = @cart.cart_items.new(item: item)

        if @cart_item.save
          item_full = Item.first(:id => params[:item_id])
          @cart_item_to_up = @cart_item.update(:price => item_full.price, :qty => params[:qty])
          flash[:notice] = "#{@cart_item}"
          redirect to ("/")
        else
          halt 401
        end
      end

      def show_small_cart
        if session[:cart_id]
          @full_cart = Cart.first(:id => session[:cart_id])
          @qty = 0 
          @price = 0
            @full_cart.cart_items.each do |item|
              @qty = @qty + item.qty
              @price = @price + item.price
            end
        else
          false
        end
      end

    end

    helpers CartItemHelper
  end
end
