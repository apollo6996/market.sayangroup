migration 3, :create_items do
  up do
    create_table :items do
      column :id,                                   Integer, :serial => true
      column :name,           DataMapper::Property::String, :length => 255
      column :descipt,        DataMapper::Property::Text
      column :price,          DataMapper::Property::Integer
      column :virtual_item,   DataMapper::Property::Boolean
      column :category_id,    DataMapper::Property::Integer
      column :material,       DataMapper::Property::Text
      column :adjrange,       DataMapper::Property::Text
      column :color,          DataMapper::Property::Text
      column :weigth,         DataMapper::Property::Text
      column :gabarits,       DataMapper::Property::Text
      column :power,          DataMapper::Property::Text
    end
  end

  down do
    drop_table :items
  end
end
