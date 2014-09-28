MarketSayangroup::App.controllers :cart_item do
include CurrentCart

#before :create do
#  set_cart
#  set_cart_items
#end

before_action :set_cart, only: [:create]

  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  # get '/example' do
  #   'Hello world!'
  # end
  
  get :cart_items do

  end

  get :cart_items, :with => :id do

  end

  get 'cart_items/new' do

  end

  post :cart_items do

  end

  put :cart_items do

  end

  delete :cart_items do

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_items
      @cart_items = CartItem.get(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_items_params
      params.require(:cart_items).permit(:product_id, :cart_id)
    end

end
