class CartItem
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :item_id, Integer
  property :cart_id, Integer
  property :item, String
  property :qty, Integer
  property :variant, String
  property :price, Integer
  property :amount, Integer
  property :created_at, DateTime

  belongs_to :item
  belongs_to :cart
end
