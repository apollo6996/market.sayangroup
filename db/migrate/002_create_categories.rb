migration 2, :create_categories do
  up do
    create_table :categories do
      column :id,                                 Integer, :serial => true
      column :name,         DataMapper::Property::String, :length => 255
      column :virtual_item, DataMapper::Property::Boolean
    end
  end

  down do
    drop_table :categories
  end
end
