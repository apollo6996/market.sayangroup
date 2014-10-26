migration 10, :create_orders do
  up do
    create_table :orders do
      column :id, Integer, :serial => true
      column :sum, DataMapper::Property::Integer
      column :delivery_address, DataMapper::Property::Text
      column :created_at, DataMapper::Property::DateTime
    end
  end

  down do
    drop_table :orders
  end
end
