class Cart
  include DataMapper::Resource

  property :id, Serial
  property :guest, Boolean

  has n, :cart_items, :constraint => :set_nil
  has n, :items, :through => :cart_items


  def add_item(item_id, qty)
    current_item = cart_items.first(item_id: item_id.to_i)

    if current_item && qty
      current_item.qty += qty.to_i
    elsif current_item
      current_item.qty += 1
    else
      if qty
        current_item = cart_items.new(item_id: item_id.to_i)
        current_item.qty += qty.to_i - 1
      else
        current_item = cart_items.new(item_id: item_id.to_i)  
      end
    end

    # if current_item
    #  current_item.qty += 1
    #else
    #  current_item = cart_items.new(item_id: item_id.to_i)
    #end

    current_item
  end

  def update_item(item_id, qty)
    current_item = cart_items.first(id: id)
    if current_item
      current_item.qty = qty
    end
    current_item
  end

end
