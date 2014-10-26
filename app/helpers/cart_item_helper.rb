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
        @cart_item = @cart.add_item(item.id)

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
          @cart_item.errors.each do |e|
            puts e
          end
          halt 500
        end
      end

      def update_qty(id, qty)
        @upd_cart_item = CartItem.first(:id => id)
        @upd_cart_item.qty = qty
        @upd_cart_item.save
      end

      def delete_cart_item(id)
        CartItem.first(id: id).destroy
      end

      def show_small_cart
        if session[:cart_id]
          @cart_id = session[:cart_id]
          @full_cart = Cart.first(:id => session[:cart_id])
          @qty = 0 
          @total_price = 0
            @full_cart.cart_items.each do |item|
              @amount = item.qty * item.price
              @qty = @qty + item.qty
              @total_price = @total_price + @amount
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

  class Admin
    def find_item(item_id)
        @item = Item.first(id: item_id)
    end
  end
end
