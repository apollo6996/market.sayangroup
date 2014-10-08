# Helper methods defined here can be accessed in any controller or view in the application

module MarketSayangroup
  class App
    module ItemHelper
      # def simple_helper_method
      # ...
      # end

      def get_catalog
        @items = Item.all
      end
    end
    helpers ItemHelper
  end
end
