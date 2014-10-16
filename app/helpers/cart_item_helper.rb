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
          if params[:qty]
            @cart_item_to_up = @cart_item.update(:price => item_full.price, :qty => params[:qty])
          else
            @cart_item_to_up = @cart_item.update(:price => item_full.price)
          end
          flash[:notice] = "#{@cart_item.qty}"
          redirect to ("/")
        else
          halt 401
        end
      end

      def show_small_cart
        if session[:cart_id]
          @cart_id = session[:cart_id]
          @full_cart = Cart.first(:id => session[:cart_id])
          @qty = 0 
          @price = 0
            @full_cart.cart_items.each do |item|
              @qty = @qty + item.qty.to_i
              @price = @price + item.price.to_i
            end
        else
          false
        end
      end

      def show_full_cart
        @full_cart = Cart.first(:id => session[:cart_id])
      end
      def find_item(item_id)
        @item = Item.first(id: item_id)
      end

    end

    helpers CartItemHelper
  end
end
