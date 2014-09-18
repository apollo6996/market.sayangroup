migration 4, :add_category_to_item do
  up do
    modify_table :items do
      add_column :category_id, Integer
    end
  end

  down do
    modify_table :items do
      drop_column :category_id
    end
  end
end
