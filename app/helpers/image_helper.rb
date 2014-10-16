# Helper methods defined here can be accessed in any controller or view in the application

module MarketSayangroup
  class App
    module ImageHelper
      # def simple_helper_method
      # ...
      # end

      def upload_image
        upload = Upload.new
        upload.file = params[:file]
        upload.save
      end

      def get_latest_image
        max = Upload.max(:id)
        @image = Upload.first(:id => max)
      end

      def get_image
        @image = Upload.first(params[:id])
      end

      def get_catalog_image(id)
        @imageface = Upload.first(:item_id => id)
      end
    end

    helpers ImageHelper
  end
end
