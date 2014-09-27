migration 7, :create_carts do
  up do
    create_table :carts do
      column :id, Integer, :serial => true
      column :guest, DataMapper::Property::Boolean
    end
  end

  down do
    drop_table :carts
  end
end
