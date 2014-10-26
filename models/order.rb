class Order
  include DataMapper::Resource

  # property <name>, <type>
  property :id,         Serial
  property :name,       String
  property :phone,      String
  property :email,      String, :format => :email_address
  property :sum,        Integer
  property :address,    Text
  property :created_at, DateTime

  has n, :cart_items


  def add_cart_items_from_cart(cart, order_id)
    @items_sum = 0
    cart.cart_items.each do |item|
      item.order_id = order_id
      item.cart_id = nil
      @items_sum += item.qty * item.price
      self.cart_items << item
    end
    self.sum = @items_sum
  end

end
