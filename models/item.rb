class Item
  include DataMapper::Resource

  # property <name>, <type>
  property :id,             Serial
  property :name,           String
  property :descipt,        Text
  property :price,          Integer
  property :virtual_item,   Boolean

  property :material,       Text
  property :adjrange,       Text
  property :power,          Text
  property :color,          Text
  property :weigth,         Text
  property :gabarits,       Text

  belongs_to :category
  has n, :uploads, constraint: :destroy, :through => Resource
  has n, :cart_items
  has n, :carts, :through => :cart_items

  before :destroy, :validation_of_reference_by_cart_items

  def validation_of_reference_by_cart_items
    
    cart_items.empty? ? true : errors.add(:base, 'Cуществуют товарные позиции.')

  end

end