migration 9, :create_uploads do
  up do
    create_table :uploads do
      column :id, Integer, :serial => true
      column :file, DataMapper::Property::Text
      column :created_at, DataMapper::Property::DateTime
    end
  end

  down do
    drop_table :uploads
  end
end
