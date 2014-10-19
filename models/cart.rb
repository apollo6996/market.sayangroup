class Cart
  include DataMapper::Resource

  property :id, Serial
  property :guest, Boolean

  has n, :cart_items, constraint: :destroy
  has n, :items, :through => :cart_items

  def add_item(item_id)
    current_item = cart_items.first(item_id: item_id)
    if current_item
      current_item.qty += 1
    else
      current_item = cart_items.new(item_id: item_id)
    end
    current_item
  end

  def update_item(id, qty)
    current_item = cart_items.first(id: id)
    if current_item
      current_item.qty = qty
    end
    current_item
  end

end
