class Group
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :name, String
  property :item_id,      Integer, :allow_nil => true, :allow_blank => true


  belongs_to :category
  has n, :items, :constraint => :set_nil
  has n, :features

end
