MarketSayangroup::Admin.controllers :orders do
  get :index do
    @title = "Orders"
    @orders = Order.all
    render 'orders/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'order')
    @order = Order.new
    render 'orders/new'
  end

  post :create do
    @order = Order.new(params[:order])
    if @order.save
      @title = pat(:create_title, :model => "order #{@order.id}")
      flash[:success] = pat(:create_success, :model => 'Order')
      params[:save_and_continue] ? redirect(url(:orders, :index)) : redirect(url(:orders, :edit, :id => @order.id))
    else
      @title = pat(:create_title, :model => 'order')
      flash.now[:error] = pat(:create_error, :model => 'order')
      render 'orders/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "order #{params[:id]}")
    @order = Order.get(params[:id])
    if @order
      render 'orders/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'order', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "order #{params[:id]}")
    @order = Order.get(params[:id])
    if @order
      if @order.update(params[:order])
        flash[:success] = pat(:update_success, :model => 'Order', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:orders, :index)) :
          redirect(url(:orders, :edit, :id => @order.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'order')
        render 'orders/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'order', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Orders"
    order = Order.get(params[:id])
    if order
      if order.destroy
        flash[:success] = pat(:delete_success, :model => 'Order', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'order')
      end
      redirect url(:orders, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'order', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Orders"
    unless params[:order_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'order')
      redirect(url(:orders, :index))
    end
    ids = params[:order_ids].split(',').map(&:strip)
    orders = Order.all(:id => ids)
    
    if orders.destroy
    
      flash[:success] = pat(:destroy_many_success, :model => 'Orders', :ids => "#{ids.to_sentence}")
    end
    redirect url(:orders, :index)
  end
end
