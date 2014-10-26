MarketSayangroup::App.controllers :cart_item do
#include CurrentCart
  
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
      halt 500
    end
  end

  put :cart_items do
    set_cart_item
  end

  put :change_qty, :with => [:id, :qty], :csrf_protection => false do
    
    if update_qty(params[:id], params[:qty])
      render 'cart/cart'
    else
      halt 400
    end
  end

  delete :cart_items, :with => :id, :csrf_protection => false do
    
    if delete_cart_item(params[:id])
      render 'cart/cart'
    else
      halt 400
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_item
      @cart_item = CartItem.get(params[:id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_items_params
      params.require(:cart_items).permit(:item_id, :cart_id, :order_id)
    end

end
