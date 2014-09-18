class Item
  include DataMapper::Resource

  # property <name>, <type>
  property :id,             Serial
  property :name,           String
  property :descipt,        Text
  property :price,          Integer
  property :virtual_item,   Boolean
  property :category_id,    Integer

  property :material,       String
  property :adjrange,       String
  

  belongs_to :category

end

DataMapper.finalize 