MarketSayangroup::App.controllers :cart_item do
#include CurrentCart

before :show, :edit, :update, :destroy do 
  set_cart_item  
end
  
  get :cart do
    show_full_cart
    render 'cart/cart'
  end

  get :cart_items do

  end

  get :cart_items, :with => :id do

  end

  get 'cart_items/new' do

  end

  post :cart_items do
    if set_cart
      create
    else
      halt 401
    end
  end

  put :cart_items do
    set_cart_item
  end

  delete :cart_items do
    set_cart_item
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_item
      @cart_item = CartItem.get(params[:id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_items_params
      params.require(:cart_items).permit(:item_id, :cart_id)
    end

end
