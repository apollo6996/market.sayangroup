class Category
  include DataMapper::Resource

  # property <name>, <type>
  property :id,           Serial
  property :name,         String
  property :virtual_item, Boolean
  
  has n, :items
end
