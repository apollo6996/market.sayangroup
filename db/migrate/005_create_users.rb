migration 5, :create_users do
  up do
    create_table :users do
      column :id, Integer, :serial => true
      column :email, DataMapper::Property::String, :length => 255
      column :name, DataMapper::Property::String, :length => 255
      column :password, DataMapper::Property::BCryptHash
      column :phone, DataMapper::Property::Integer
      column :company_name, DataMapper::Property::String, :length => 255
      column :inn, DataMapper::Property::Integer
      column :kpp, DataMapper::Property::Integer
      column :bank_account, DataMapper::Property::Integer
      column :account_number, DataMapper::Property::Integer
      column :role, DataMapper::Property::String, :length => 255
    end
  end

  down do
    drop_table :users
  end
end
