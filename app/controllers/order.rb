MarketSayangroup::App.controllers :order do
  
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
  
  get :new do
    if @cart.cart_items.empty?
      "Ваша Корзина Пуста"
    end
  end

  delete :delete_cart, :with => :cart_id do

  end

  post :create do
    @cart = Cart.get(session[:cart_id])
    @order = Order.new(params[:order])
    @order.add_cart_items_from_cart(@cart, @order.id)
    if @order.save
      Cart.first(id: session[:cart_id]).destroy!
      #redirect to ('/order/delete_cart/#{:cart_id}')
      session[:cart_id] = nil
      redirect to ("/")
    else
      @order.errors.each do |e|
        puts e
      end
      @cart.errors.each do |e|
        puts e
      end
      halt 500
    end
  end

end
