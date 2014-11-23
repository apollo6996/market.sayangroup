migration 13, :create_features do
  up do
    create_table :features do
      column :id, Integer, :serial => true
      column :name, DataMapper::Property::String, :length => 255
    end
  end

  down do
    drop_table :features
  end
end
