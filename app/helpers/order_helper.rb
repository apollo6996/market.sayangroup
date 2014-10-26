# Helper methods defined here can be accessed in any controller or view in the application

module MarketSayangroup
  class Admin
    module OrderHelper
      # def simple_helper_method
      # ...
      # end
    
      def get_order(order_id)
        @this_order = Order.first(id: order_id)
        @sum = 0
        @this_order.cart_items.each do |item|
          @sum += item.qty * item.price
        end
        return @sum
      end

    end

    helpers OrderHelper
  end
end
