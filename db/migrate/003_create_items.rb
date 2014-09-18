migration 3, :create_items do
  up do
    create_table :items do
      column :id,                                   Integer, :serial => true
      column :name,           DataMapper::Property::String, :length => 255
      column :descipt,        DataMapper::Property::Text
      column :price,          DataMapper::Property::Integer
      column :virtual_item,   DataMapper::Property::Boolean
      column :category_id,    DataMapper::Property::Integer
      column :material,       DataMapper::Property::String
      column :adjrange,       DataMapper::Property::String

    end
  end

  down do
    drop_table :items
  end
end
