class Feature
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :name, String

  property :item_id,      Integer, :allow_nil => true, :allow_blank => true

  belongs_to :group
  belongs_to :item
  
end
