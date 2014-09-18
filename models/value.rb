class Value
  include DataMapper::Resource

  # property <name>, <type>
  property :id,             Serial
  property :value,          Integer

end
