migration 11, :add_orders_to_cart_items do
  up do
    modify_table :cart_items do
      add_column :orders, Reference, :allow_nil => true
    end
  end

  down do
    modify_table :cart_items do
      drop_column :orders
    end
  end
end
