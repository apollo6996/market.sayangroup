class CartItem
  include DataMapper::Resource

  # property <name>, <type>
  property :id,           Serial
  property :qty,          Integer, :default => 1
  property :variant,      String
  property :price,        Integer
  property :cart_id,      Integer, :allow_nil => true, :allow_blank => true
  property :order_id,     Integer, :allow_nil => true, :allow_blank => true
  property :created_at,   DateTime

  belongs_to :item
  belongs_to :cart
  belongs_to :order
end
