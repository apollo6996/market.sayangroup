# Helper methods defined here can be accessed in any controller or view in the application

module MarketSayangroup
  class App
    module ItemHelper
      # def simple_helper_method
      # ...
      # end

      def get_catalog
        @items = Item.all
        @allgroups = Group.all
        @allcategory = Category.all
      end

      def get_related_to_group_items(group_id)
        @groupItem = Item.all(:group_id => group_id)
      end

      def get_item_and_image
        @this_item = Item.first(id: params[:id])
        @this_image = Upload.first(:item_id => params[:id])
        @all_images = Upload.all(:item_id => params[:id]) - Upload.first(:item_id => params[:id])

      end

        def find_attr(feature_id)
          @this_item.attrs[feature_id]
        end

      #def get_category
      #  @category = 
      #end
    end
    helpers ItemHelper
  end
end
