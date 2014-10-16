class CartItem
  include DataMapper::Resource

  # property <name>, <type>
  property :id,           Serial
  property :qty,          Integer, :default => 1
  property :variant,      String
  property :price,        Integer
  property :amount,       Integer
  property :created_at,   DateTime

  belongs_to :item
  belongs_to :cart
end
