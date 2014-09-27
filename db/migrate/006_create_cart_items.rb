migration 6, :create_cart_items do
  up do
    create_table :cart_items do
      column :id, Integer, :serial => true
      column :item_id, DataMapper::Property::Integer
      column :cart_id, DataMapper::Property::Integer
      column :item, DataMapper::Property::String, :length => 255
      column :qty, DataMapper::Property::Integer
      column :variant, DataMapper::Property::String, :length => 255
      column :price, DataMapper::Property::Integer
      column :amount, DataMapper::Property::Integer
      column :created_at, DataMapper::Property::DateTime
    end
  end

  down do
    drop_table :cart_items
  end
end
