class Cart
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :guest, Boolean

  has n, :cart_items, constraint: :destroy
  has n, :items, :through => :cart_items
end
